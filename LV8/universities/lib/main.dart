import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universities/bloc/home_bloc.dart';
import 'package:universities/model/university.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => HomeBloc(),
          child: Home(),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(FetchButtonPressed());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Popis sveučilišta",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
            if (state is Error) {
              return showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text("Error"),
                  content: Text(
                      "URLSessionTask failed with error: The Internet connection appears to be offline."),
                  actions: [
                    CupertinoButton(
                        child: Text("Okay"),
                        onPressed: () => Navigator.pop(context)),
                  ],
                ),
              );
            }
          }, builder: (context, state) {
            if (state is FetchingData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DataFetched) {
              List<University> universityList =
                  BlocProvider.of<HomeBloc>(context).universityList;
              return Expanded(
                child: ListView.builder(
                  itemCount: universityList.length,
                  itemBuilder: (context, index) => Container(
                      height: 90,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(universityList[index].name),
                          Text(universityList[index].country),
                          Text(universityList[index].url),
                          Divider()
                        ],
                      )),
                ),
              );
            }
            if (state is Error) {
              return Center(
                child: Text("Error happend while fetching data!"),
              );
            }
            return Container();
          }),
        ],
      )),
    );
  }
}
