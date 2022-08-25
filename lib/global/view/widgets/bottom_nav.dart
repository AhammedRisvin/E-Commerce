import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'package:menz_cart_app/global/view_model/global_provider.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          BottomNavItems(
            index: 0,
            section: 'Home',
            icon1: Icons.man,
            icon2: Icons.man,
          ),
          BottomNavItems(
            index: 1,
            section: 'Categories',
            icon1: Icons.widgets_rounded,
            icon2: Icons.widgets_outlined,
          ),
          BottomNavItems(
            index: 2,
            section: 'Notification',
            icon1: Icons.notifications,
            icon2: Icons.notifications_none,
          ),
          BottomNavItems(
            index: 3,
            section: 'Account',
            icon1: Icons.person,
            icon2: Icons.person_outline_outlined,
          ),
          BottomNavItems(
            index: 4,
            section: 'Cart',
            icon1: Icons.shopping_cart,
            icon2: Icons.shopping_cart_outlined,
          ),
        ],
      ),
    );
  }
}

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({
    Key? key,
    required this.index,
    required this.section,
    required this.icon1,
    required this.icon2,
  }) : super(key: key);
  final int index;
  final String section;
  final IconData icon1;
  final IconData icon2;
  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalProvider>(
      builder: (context, value, _) {
        return Column(
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                value.onTabIndexChange(index);
              },
              icon: value.pageIndex == index
                  ? BottomNavIcon(
                      icon: icon1,
                    )
                  : NonBottomNavIcon(
                      icon: icon2,
                    ),
            ),
            value.pageIndex != index
                ? Text(
                    section,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black26,
                    ),
                  )
                : Text(
                    section,
                    style: TextStyle(color: pBlue),
                  ),
          ],
        );
      },
    );
  }
}

class NonBottomNavIcon extends StatelessWidget {
  const NonBottomNavIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.black26,
      size: 30,
    );
  }
}

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: pBlue,
      size: 30,
    );
  }
}