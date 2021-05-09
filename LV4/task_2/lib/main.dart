import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_2/bloc/home_bloc.dart';
import 'package:task_2/model/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<HomeBloc>(context).add(FetchButtonPressed()),
              child: Text("Fetch Data")),
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is FetchingData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DataFetched) {
              List<User> usersList =
                  BlocProvider.of<HomeBloc>(context).usersList;
              return SizedBox(
                height: 600,
                child: ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(usersList[index].name),
                          subtitle: Text(usersList[index].email),
                        )),
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
