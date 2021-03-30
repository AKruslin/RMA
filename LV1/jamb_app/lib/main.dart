import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dice_bloc.dart';

void main() {
  runApp(FlutterJamb());
}

class FlutterJamb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocProvider(
        create: (context) => DiceBloc(),
        child: BlocConsumer<DiceBloc, DiceState>(
          listener: (context, state) {
            List<int> dices = BlocProvider.of<DiceBloc>(context).diceValues;
            dices.sort();
            if (state is CheckCombo && dices[0] != 0) {
              if ((dices[0] == dices[4])) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Text("JAMB"),
                          actions: [
                            ElevatedButton(
                                child: Text("Back"),
                                onPressed: () => Navigator.pop(context)),
                          ],
                        ));
                BlocProvider.of<DiceBloc>(context).add(ComboFound());
              }
              if (dices[1] == dices[0] + 1 &&
                  dices[2] == dices[1] + 1 &&
                  dices[3] == dices[2] + 1 &&
                  dices[4] == dices[3] + 1) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Text("SKALA"),
                          actions: [
                            ElevatedButton(
                                child: Text("Back"),
                                onPressed: () => Navigator.pop(context)),
                          ],
                        ));
                BlocProvider.of<DiceBloc>(context).add(ComboFound());
              }
              if (dices[0] == dices[3] || dices[1] == dices[4]) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Text("POKER"),
                          actions: [
                            ElevatedButton(
                                child: Text("Back"),
                                onPressed: () => Navigator.pop(context)),
                          ],
                        ));
                BlocProvider.of<DiceBloc>(context).add(ComboFound());
              }
            }
          },
          builder: (context, state) {
            if (state is DiceReRolled || state is CheckCombo) {
              List<bool> diceLocked =
                  BlocProvider.of<DiceBloc>(context).lockedDices;
              int numberOfRolesLeft =
                  BlocProvider.of<DiceBloc>(context).numberOfRoles;
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: diceLocked.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              width: 40,
                              height: 40,
                              color:
                                  diceLocked[index] ? Colors.grey : Colors.blue,
                              child: Center(
                                child: Text(BlocProvider.of<DiceBloc>(context)
                                    .diceValues[index]
                                    .toString()),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                                onPressed: () {
                                  if (numberOfRolesLeft != 0) {
                                    setState(() {
                                      diceLocked[index] = !diceLocked[index];
                                    });
                                  }
                                },
                                child: Text("Lock"))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<DiceBloc>(context).add(RollDice());
                    },
                    child:
                        Text(numberOfRolesLeft == 3 ? "Restart" : "Throw Dice"),
                  ),
                  Text("Rolls left: " + (3 - numberOfRolesLeft).toString())
                ],
              );
            }
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<DiceBloc>(context).add(RollDice());
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: 30),
                  )),
            );
          },
        ),
      ),
    ));
  }
}
