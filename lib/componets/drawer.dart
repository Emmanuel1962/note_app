import 'package:flutter/material.dart';
import 'package:note_app/componets/drawerTile.dart';
import 'package:note_app/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // header
          DrawerHeader(
            child: Icon(Icons.edit),
          ),
          SizedBox(
            height: 25,
          ),
          // note tile
          DrawerTile(
            title: 'Notes',
            leading: Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          // setting tile
          DrawerTile(
              title: 'Settings',
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              })
        ],
      ),
    );
  }
}
