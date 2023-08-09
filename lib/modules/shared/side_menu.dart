import 'package:flutter/material.dart';
import 'package:pokedex/core/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return NavigationDrawer(
      elevation: 1,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Pokedex App', style: textStyles.titleLarge),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Divider(),
        ),
        ...appMenuItems.map(
          (menuItem) => NavigationDrawerDestination(
              icon: Icon(menuItem.icon), label: Text(menuItem.title)),
        )
      ],
    );
  }
}
