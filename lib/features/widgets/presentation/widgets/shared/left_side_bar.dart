import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class LeftSideBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const LeftSideBar({super.key, required this.scaffoldKey});

  @override
  State<LeftSideBar> createState() => _LeftSideBarState();
}

class _LeftSideBarState extends State<LeftSideBar> {
  int? currentIndex;

  _handlerItemClick(int value) {
    setState(() {
      currentIndex = value;
    });
    context.push(appMenuItems[value].link);
    widget.scaffoldKey.currentState?.closeDrawer();
    // Scaffold.of(context).closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top >= 25;

    return NavigationDrawer(
        selectedIndex: currentIndex,
        onDestinationSelected: _handlerItemClick,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, hasNotch ? 20 : 30, 10, 15),
            child: const Text("Main"),
          ),
          ...appMenuItems.sublist(0, 3).map((item) =>
              NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title))),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 10, 15),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 10, 15),
            child: Text("More Options"),
          ),
          ...appMenuItems.sublist(3).map((item) => NavigationDrawerDestination(
              icon: Icon(item.icon), label: Text(item.title))),
        ]);
  }
}
