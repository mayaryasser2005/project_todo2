import 'package:flutter/material.dart';
import 'package:project_todo2/add_bottomsheet/add_bottomsheet.dart';
import 'package:project_todo2/screen/home/tabs/list.dart';
import 'package:project_todo2/screen/home/tabs/setting.dart';

import '../../utils/assets_color.dart';

class Home extends StatefulWidget {
  static const String routeNamed = "Home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [const ListTab(), const SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("To Do List"),
          backgroundColor: AppColors.primary,
          centerTitle: true,
        ),
        body: tabs[currentIndex],
        backgroundColor: const Color.fromRGBO(221, 234, 217, 1.0),
        floatingActionButton: buildFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildbottomNavigationBar());
  }

  buildFab() => FloatingActionButton(
        onPressed: () {
          AddBottomSheet.show(context);
        },
        backgroundColor: AppColors.primary,
        shape: const StadiumBorder(
            side: BorderSide(color: Colors.white, width: 3)),
        child: const Icon(Icons.add),
      );

  buildbottomNavigationBar() => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        notchMargin: 8,
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: currentIndex,
            onTap: (tappedIndex) {
              currentIndex = tappedIndex;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                  ),
                  label: "list"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "settings"),
            ]),
      );
}
