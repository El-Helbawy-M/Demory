import 'package:flutter/material.dart';
import 'package:mega_cards/Layout/Screens/ChangeModScreen.dart';
import 'package:mega_cards/Layout/Screens/HistoryScreen.dart';
import 'package:mega_cards/Layout/Screens/LobbyScreen.dart';
import 'package:mega_cards/Layout/Screens/ProfileScreen.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:mega_cards/Layout/Widgets/AppMods.dart';
import 'package:provider/provider.dart';

Drawer appDrawer(Map<String, Color> theme, BuildContext context, Mod currentMod,
        String mod) =>
    Drawer(
      child: Container(
        color: theme['Background Color'],
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Container(
                      margin:
                          (currentMod == Mod.Normal || currentMod == Mod.Dark)
                              ? EdgeInsets.all(10)
                              : null,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(modImages[currentMod]),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: (currentMod == Mod.DetectiveConan ||
                              currentMod == Mod.Naruto)
                          ? null
                          : Border.all(width: 1, color: Colors.grey),
                    ),
                  ),
                ),
                DrawerItem(
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {
                    Navigator.pop(context);
                    smartNavigator(context, mod, LobbyScreen());
                  },
                  theme: theme,
                ),
                DrawerItem(
                  icon: Icons.storage,
                  title: 'History',
                  onTap: () {
                    Navigator.pop(context);
                    smartNavigator(context, mod, HistoryScreen());
                  },
                  theme: theme,
                ),
                DrawerItem(
                  icon: Icons.person,
                  title: 'Profile',
                  onTap: () {
                    Navigator.pop(context);
                    smartNavigator(context, mod, ProfileScreen());
                  },
                  theme: theme,
                ),
                DrawerItem(
                  icon: Icons.color_lens,
                  title: 'Mods',
                  onTap: () {
                    Navigator.pop(context);
                    smartNavigator(context, mod, ChangeModScreen());
                  },
                  theme: theme,
                ),
                Divider(
                  color: theme["Container Color"],
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
      // Column(children: [
      //   Container(
      //     height: 200,
      //     child: Center(
      //       child:
      //     ),
      //   ),
      //   Expanded(
      //     child: Container(

      //     ),
      //   ),
      // ])
    );

class DrawerItem extends StatelessWidget {
  const DrawerItem({this.icon, this.onTap, this.title, this.theme});
  final title, icon, onTap;
  final Map<String, Color> theme;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: theme["Container Color"],
          thickness: 1,
        ),
        ListTile(
          leading: Icon(
            icon,
            color: theme["Color 2"],
          ),
          title: Text(
            title,
            style: TextStyle(color: theme['Color 2']),
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}

void smartNavigator(BuildContext context, String mod, Widget child) =>
    (child.runtimeType == LobbyScreen().runtimeType ||
            child.runtimeType == ChangeModScreen().runtimeType)
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => ThemeHandler(mod),
                child: child,
              ),
            ),
          )
        : Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => ThemeHandler(mod),
                child: child,
              ),
            ),
          );
