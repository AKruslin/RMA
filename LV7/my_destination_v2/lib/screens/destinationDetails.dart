import 'package:flutter/cupertino.dart';
import 'package:my_destination_v1/model/destination.dart';

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;
  const DestinationDetailsScreen({Key key, this.destination}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: "Moje destinacije",
        ),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Text(destination.name),
          Text(destination.description),
          Text(destination.id.toString()),
          destination.url != ""
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    destination.url,
                    fit: BoxFit.contain,
                  ),
                )
              : Container()
        ],
      )),
    );
  }
}
