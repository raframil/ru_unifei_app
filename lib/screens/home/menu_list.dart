import 'package:page_transition/page_transition.dart';
import 'package:ru_unifei_app/models/menu.dart';
import 'package:ru_unifei_app/screens/home/home.dart';
import 'package:ru_unifei_app/screens/home/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_unifei_app/screens/screens.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    final menus = Provider.of<List<Menu>>(context) ?? [];
    menus.sort((a, b) => a.orderNumber.compareTo(b.orderNumber));
    return ListView.builder(
      shrinkWrap: true,
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return MenuTile(menu: menus[index]);
      },
    );
  }
}

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menus = Provider.of<List<Menu>>(context) ?? [];
    menus.sort((a, b) => a.orderNumber.compareTo(b.orderNumber));
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(
              'assets/images/unifei_logo.png',
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Horários'),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      child: ScheduleScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Sobre'),
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      child: AboutScreen()));
            },
          ),
        ],
      ),
    );
  }
}
