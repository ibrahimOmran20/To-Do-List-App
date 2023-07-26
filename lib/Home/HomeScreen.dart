import 'package:flutter/material.dart';
import 'package:to_do_app/Home/Add%20Buttom%20Sheet/Add%20Task%20Buttom%20Sheet.dart';
import 'package:to_do_app/Home/Settings%20Tab/SettingsTab.dart';
import 'package:to_do_app/Home/Task%20List%20Tab/Task%20List%20Tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text('ToDo List', style: Theme.of(context).textTheme.bodyLarge)),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_outlined), label: AppLocalizations.of(context)?.taskList),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: AppLocalizations.of(context)?.settings)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddButtomSheet();
        },
        child: Icon(
          Icons.add,
          size: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  void showAddButtomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddTaskButtomSheet();
        });
  }

  List<Widget> tabs = [TaskListTab(), SettingTab()];
}
