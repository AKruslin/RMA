import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspiring_person_app/bloc/home_bloc.dart';
import 'package:inspiring_person_app/personRepository.dart';
import 'package:inspiring_person_app/screens/home.dart';

class InserPersonScreen extends StatefulWidget {
  @override
  _InserPersonScreenState createState() => _InserPersonScreenState();
}

class _InserPersonScreenState extends State<InserPersonScreen> {
  String imageURL = "";
  String description = "";
  String quote = "";
  DateTime birthday = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add new Inspiring Person"),
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen())))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              onChanged: (url) {
                imageURL = url;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.photo_size_select_actual_rounded),
                labelText: 'Enter person picture URL must end with .jpg/.png',
              ),
            ),
            CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(1100),
                lastDate: DateTime.now(),
                onDateChanged: (date) {
                  birthday = date;
                }),
            TextField(
              onChanged: (value) {
                description = value;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.textsms_rounded),
                labelText: 'Enter Description',
              ),
            ),
            TextField(
              onChanged: (value) {
                quote = value;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.short_text_sharp),
                labelText: 'Enter Quote',
              ),
            ),
            BlocProvider(
              create: (_) => HomeBloc(),
              child:
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      if (imageURL != "" &&
                          description != "" &&
                          quote != "" &&
                          birthday != null) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        BlocProvider.of<HomeBloc>(context).add(
                          AddPerson(InspiringPerson(
                              image: imageURL,
                              description: description,
                              birthday: birthday,
                              quote: quote)),
                        );
                      }
                    },
                    child: Text("Save person"));
              }),
            )
          ],
        ),
      ),
    );
  }
}
