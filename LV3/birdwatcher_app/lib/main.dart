import 'package:birdwatcher_app/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        create: (context) => CounterBloc(),
        child: BirdCounterScreen(),
      ),
    );
  }
}

class BirdCounterScreen extends StatefulWidget {
  @override
  _BirdCounterScreenState createState() => _BirdCounterScreenState();
}

class _BirdCounterScreenState extends State<BirdCounterScreen> {
  @override
  void initState() {
    BlocProvider.of<CounterBloc>(context).add(LoadData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              if (state is CounterInitial || state is CounterIncreased) {
                return Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      color: state.currentColor,
                      child: Center(
                        child: Text(
                          state.counterValue.toString(),
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text("Red"),
                          onPressed: () {
                            BlocProvider.of<CounterBloc>(context)
                                .add(UpdateCounter(Colors.red));
                          },
                        ),
                        ElevatedButton(
                          child: Text("Blue"),
                          onPressed: () {
                            BlocProvider.of<CounterBloc>(context)
                                .add(UpdateCounter(Colors.blue));
                          },
                        ),
                        ElevatedButton(
                          child: Text("Green"),
                          onPressed: () {
                            BlocProvider.of<CounterBloc>(context)
                                .add(UpdateCounter(Colors.green));
                          },
                        ),
                        ElevatedButton(
                          child: Text("Yellow"),
                          onPressed: () {
                            BlocProvider.of<CounterBloc>(context)
                                .add(UpdateCounter(Colors.yellow));
                          },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      child: Text("Reset"),
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(ResetCounter());
                      },
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            }),
          ],
        ),
      ),
    );
  }
}
