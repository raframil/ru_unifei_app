import 'package:ru_unifei_app/models/menu.dart';
import 'package:flutter/material.dart';

class MenuDetails extends StatelessWidget {
  final Menu menu;
  MenuDetails({this.menu});

  @override
  Widget build(BuildContext context) {
    var _appBarColor = Colors.indigo;
    if (menu.diaDaSemana == 'Segunda-feira') {
      _appBarColor = Colors.orange;
    }
    if (menu.diaDaSemana == 'Terça-feira') {
      _appBarColor = Colors.purple;
    }
    if (menu.diaDaSemana == 'Quarta-feira') {
      _appBarColor = Colors.lightBlue;
    }
    if (menu.diaDaSemana == 'Quinta-feira') {
      _appBarColor = Colors.lightGreen;
    }
    if (menu.diaDaSemana == 'Sexta-feira') {
      _appBarColor = Colors.pink;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _appBarColor,
          title: Text(menu.diaDaSemana),
        ),
        body: Menulist(menu: menu));
  }
}

class Menulist extends StatelessWidget {
  final Menu menu;
  Menulist({this.menu});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: new Image.asset(
                'assets/images/restaurant/096-rice.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(menu.pratoBase),
            subtitle: Text('Prato Base'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: new Image.asset(
                'assets/images/restaurant/073-roast-chicken.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(menu.pratoPrincipalAlmoco),
            subtitle: Text('Prato Principal - Almoço'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: new Image.asset(
                'assets/images/restaurant/080-soup-1.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(menu.pratoPrincipalJantar),
            subtitle: Text('Prato Principal - Jantar'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: new Image.asset(
                'assets/images/restaurant/071-vegetables.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(menu.vegetariana),
            subtitle: Text('Opção Vegetariana'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: new Image.asset(
                'assets/images/restaurant/074-spaghetti.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(menu.guarnicao),
            subtitle: Text('Guarnição'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: new Image.asset(
                'assets/images/restaurant/045-vegetables-1.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(menu.saladas),
            subtitle: Text('Saladas'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: new Image.asset(
                'assets/images/restaurant/088-ice-cream.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(menu.sobremesa),
            subtitle: Text('Sobremesa'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: new Image.asset(
                'assets/images/juice.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(menu.bebida),
            subtitle: Text('Bebida'),
          ),
        ),
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              child: new Image.asset(
                'assets/images/restaurant/041-sauces.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(menu.molhos),
            subtitle: Text('Molhos'),
          ),
        ),
      ],
    );
  }
}
