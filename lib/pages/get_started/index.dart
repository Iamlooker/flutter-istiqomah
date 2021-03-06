import 'package:flutter/material.dart';
import 'package:istiqomah/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Container(
          // width: 300,
          // height: 700,
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              _header(),
              Expanded(child: _content(context)),
              _button(context),
            ],
          )),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      child: Text(
        'ISTIQOMAH',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff4a73c2),
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    List<String> lists = const [
      "Helping you achieve life resolution",
      "Set the type of activity, with the reminder feature",
      "Get a summary of the data during your Istiqomah journey"
    ];

    List<Widget> listWidget = _createListWidget(context, lists);

    return (Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listWidget,
      ),
    ));
  }

  Widget _button(BuildContext context) {
    return FlatButton(
      minWidth: 300,
      color: Color(0xff4285F4),
      textColor: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(15),
      splashColor: Colors.blue[50],
      onPressed: () {
        Future<SharedPreferences> prefsFuture = SharedPreferences.getInstance();
        prefsFuture.then((prefs) {
          prefs.setBool('isStarted', true);
        });
        Navigator.of(context).pushReplacementNamed(Routes.home);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        "Start",
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  // Create List Widget from List<String>
  List<Widget> _createListWidget(BuildContext context, List<String> items) {
    TextStyle textStyle =
        TextStyle(fontSize: 22, color: Colors.white, height: 1.5);
    TextStyle numberStyle =
        TextStyle(fontSize: 18, color: Theme.of(context).primaryColor);
    List<Widget> result = [];

    var number = 1;
    var colorsAvail = new List(3);
    colorsAvail[0] = Color(0xffDB4437);
    colorsAvail[1] = Color(0xffF4B400);
    colorsAvail[2] = Color(0xff0F9D58);
    var i = 0;
    items.forEach((text) {
      result.add(Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35,
                height: 35,
                margin: EdgeInsets.only(right: 20, top: 10),
                decoration: BoxDecoration(
                  color: colorsAvail[i],
                  borderRadius: BorderRadius.all(const Radius.circular(50)),
                ),
                child: Center(
                  child: Text(
                    number.toString(),
                    style: numberStyle,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            ],
          )));
      number++;
      i++;
    });

    return result;
  }
}
