import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:inspiring_person_app/bloc/home_bloc.dart';
import 'package:inspiring_person_app/models/inspiringPerson.dart';
import 'package:inspiring_person_app/screens/home.dart';

class EditPersonScreen extends StatefulWidget {
  final InspiringPerson person;
  const EditPersonScreen({
    this.person,
  });
  @override
  _EditPersonScreenState createState() => _EditPersonScreenState();
}

class _EditPersonScreenState extends State<EditPersonScreen> {
  @override
  Widget build(BuildContext context) {
    InspiringPerson person = widget.person;
    String imageURL = person.image;
    String description = person.description;
    String quote = person.quote;
    DateTime birthday = person.birthday;
    TextEditingController imageTextController =
        TextEditingController(text: imageURL);
    TextEditingController descriptionTextController =
        TextEditingController(text: description);
    TextEditingController quoteTextController =
        TextEditingController(text: quote);
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
              controller: imageTextController,
              onChanged: (url) {
                imageURL = url;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.photo_size_select_actual_rounded),
                labelText: 'Enter person picture URL must end with .jpg/.png',
              ),
            ),
            CalendarDatePicker(
                initialDate: birthday,
                firstDate: DateTime(1100),
                lastDate: DateTime.now(),
                onDateChanged: (date) {
                  birthday = date;
                }),
            TextField(
              controller: descriptionTextController,
              onChanged: (value) {
                description = value;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.textsms_rounded),
                labelText: 'Enter Description',
              ),
            ),
            TextField(
              controller: quoteTextController,
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
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        if (imageURL != "" &&
                            description != "" &&
                            quote != "") {
                          repository.editInspiringPerson(
                            InspiringPerson(
                                image: imageURL,
                                description: description,
                                birthday: birthday,
                                quote: quote),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        }
                      },
                      child: Text("Save edit"));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
