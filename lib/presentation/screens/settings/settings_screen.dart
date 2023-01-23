import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:odc_workshop/presentation/screens/settings/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              SettingsTile(
                icon: Ionicons.person_circle_outline,
                title: "FAQ",
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              SettingsTile(
                icon: Ionicons.pencil_outline,
                title: "Terms & Conditions",
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              SettingsTile(
                icon: Ionicons.moon_outline,
                title: "Our Partenrs",
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              SettingsTile(
                icon: Ionicons.language_outline,
                title: "Support",
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              SettingsTile(
                icon: Ionicons.log_out_outline,
                title: "Logout",
                onTap: () {
                  exitCode;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

















/*
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
            child: Text(
          'Setting',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: ListView()
    ));
  }
  }








GestureDetector buildAc
    /*
        SettingsList(
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                  value: Text('English'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: true,
                  leading: Icon(Icons.format_paint),
                  title: Text('Enable custom theme'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    */
*/
