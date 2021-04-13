import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspiring_person_app/bloc/home_bloc.dart';
import 'package:inspiring_person_app/screens/editPerson.dart';
import 'package:inspiring_person_app/screens/insertPerson.dart';
import 'package:inspiring_person_app/widgets/personInfo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inspiring People"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InsertPersonScreen(),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeBloc(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial || state is ListUpdated) {
                List inspiringPeopleList = state.list;
                return ListView.builder(
                  itemCount: inspiringPeopleList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(
                                "Quote: " + inspiringPeopleList[index].quote),
                            actions: [
                              ElevatedButton(
                                  child: Text("Back"),
                                  onPressed: () => Navigator.pop(context)),
                            ],
                          ),
                        ),
                        child: Image.network(
                          inspiringPeopleList[index].image,
                          height: 400,
                        ),
                      ),
                      PersonInfo(person: inspiringPeopleList[index]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            child: Text("Update info"),
                            onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPersonScreen(
                                  person: inspiringPeopleList[index],
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                repository.deleteInspiringPerson(
                                    inspiringPeopleList[index]);
                              });
                            },
                            child: Text("Delete that person"),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
