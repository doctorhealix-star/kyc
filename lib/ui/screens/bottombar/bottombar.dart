import 'package:flutter/material.dart';

import '../chatbot/chatbot.dart';
import '../homescreen/homescreen.dart';
import '../kycsecondscreen/kycsecondscreen.dart';
import '../notificationscreen/notificationscreen.dart';
import 'component/bottombarwidget.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int currentindex = 0;
  final List<Widget> pages = const [
    Homescreen(),
    ChatBotScreen(),
    NotificationScreen(),
  ];
  Future<bool> _onWillPop() async {
    if (currentindex > 0) {
      // Go back step by step
      setState(() {
        currentindex -= 1;
      });
      return false; // prevent app exit
    } else {
      // Already on Home, show exit confirmation
      final shouldExit = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // Don't exit
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), // Exit
              child: const Text('Yes'),
            ),
          ],
        ),
      );
      return shouldExit ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: pages[currentindex],
        bottomNavigationBar:  AppBottombar(
          currentindex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
        ),

      ),
    );
  }
}
