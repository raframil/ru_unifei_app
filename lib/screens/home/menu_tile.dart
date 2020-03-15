import 'package:page_transition/page_transition.dart';
import 'package:ru_unifei_app/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:ru_unifei_app/screens/home/menu_details.dart';

class MenuTile extends StatelessWidget {
  final Menu menu;
  MenuTile({this.menu});

  @override
  Widget build(BuildContext context) {
    var _backgroundColor = [Colors.indigo, Colors.indigoAccent];
    if (menu.diaDaSemana == 'Segunda-feira') {
      _backgroundColor = [Colors.orange, Colors.deepOrangeAccent];
    }
    if (menu.diaDaSemana == 'Terça-feira') {
      _backgroundColor = [Colors.purple, Colors.deepPurpleAccent];
    }
    if (menu.diaDaSemana == 'Quarta-feira') {
      _backgroundColor = [Colors.lightBlue, Colors.blueAccent];
    }
    if (menu.diaDaSemana == 'Quinta-feira') {
      _backgroundColor = [Colors.lightGreen, Colors.greenAccent];
    }
    if (menu.diaDaSemana == 'Sexta-feira') {
      _backgroundColor = [Colors.pink, Colors.pinkAccent];
    }
    return Container(
      height: 100.0,
      margin: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(color: Colors.grey[300], offset: Offset(4.0, 4.0))
          ],
          gradient: new LinearGradient(
              colors: _backgroundColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.clamp)),
      child: Ink(
        child: new InkWell(
          onTap: () {
            Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: MenuDetails(menu: menu)));
          },
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.only(left: 10.0, right: 10.0),
              ),
              new Expanded(
                  child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    menu.diaDaSemana,
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text(
                    menu.data,
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
              new Padding(
                padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                child: new Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
