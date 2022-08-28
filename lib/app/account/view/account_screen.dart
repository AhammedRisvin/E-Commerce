import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'widgets/account_listtile.dart';
import 'widgets/profile_card.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: ListView(
        children: [
          const ProfileCard(),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10),
            child: AcountUserSection(),
          ),
          ColoredBox(
            color: kWhite,
            child: Column(
              children: const [
                AcountTexWidgget(
                  text: 'ABOUT US',
                ),
                AcountTexWidgget(
                  text: 'PRIVACY POLICY',
                ),
                AcountTexWidgget(
                  text: 'TERMS OF USE',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AcountTexWidgget extends StatelessWidget {
  const AcountTexWidgget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class ExpandCard extends StatelessWidget {
  const ExpandCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ExpansionTile(
        title: Text(
          "LOGIN/SIGN UP",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              'LOGIN',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            title: Text(
              'SIGN UP',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}