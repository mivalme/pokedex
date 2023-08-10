import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return NavigationDrawer(
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        widget.scaffoldKey.currentState?.closeDrawer();
        context.push(menuItem.link);        
      },
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
