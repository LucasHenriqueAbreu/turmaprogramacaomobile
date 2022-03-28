import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:  [
          ListTile(
            title: const Text('Página 1'),
            onTap: () {
              _goTo(context, '/one');
            },
          ),
          ListTile(
            title: const Text('Página 2'),
            onTap: () {
              _goTo(context, '/two');
            },
          ),
          ListTile(
            title: const Text('Página 3'),
            onTap: () {
              _goTo(context, '/tree');
            },
          )
        ],
      ),
    );
  }

  void _goTo(BuildContext context, String route) {
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }
}
