import 'package:arzonuz/features/arzonuz/home/presentation/pages/home_screen.dart';
import 'package:arzonuz/features/arzonuz/notifications/presentation/pages/notifications_screen.dart';
import 'package:arzonuz/features/arzonuz/process/presentation/pages/order_screen.dart';
import 'package:arzonuz/features/arzonuz/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const NotificationsScreen(),
    const OrderScreen(),
    const ProfileScreen()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home.png',
                width: 24,
                height: 24,
                color: currentIndex == 0 ? Colors.deepPurple : Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/notif.png',
                width: 24,
                height: 24,
                color: currentIndex == 1 ? Colors.deepPurple : Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/order.png',
                width: 24,
                height: 24,
                color: currentIndex == 2 ? Colors.deepPurple : Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/profile.png',
                width: 24,
                height: 24,
                color: currentIndex == 3 ? Colors.deepPurple : Colors.grey,
              ),
              label: ''),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
