import 'package:flutter/material.dart';
import 'package:mega_cards/Data/Sources/UserData.dart';
import 'package:mega_cards/Layout/Screens/LobbyScreen.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:mega_cards/Layout/Widgets/AppDrawer.dart';
import 'package:mega_cards/Layout/Widgets/AppMods.dart';
import 'package:provider/provider.dart';

class ChangeModScreen extends StatefulWidget {
  ChangeModScreen({this.mod});
  final mod;
  @override
  _ChangeModScreenState createState() => _ChangeModScreenState();
}

class _ChangeModScreenState extends State<ChangeModScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeHandler>(context);
    return Scaffold(
      //=============================================
      //=============================================
      backgroundColor: theme.theme['Background Color'],
      //=============================================
      //=============================================
      appBar: AppBar(
        backgroundColor: theme.theme['Background Color'],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: theme.theme['Color 2'],
          onPressed: () => smartNavigator(context, theme.mode, LobbyScreen()),
        ),
      ),
      //=============================================
      //=============================================
      body: GridView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            theme.setMod = Mod.values[index];
          },
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
              color: themeData[Mod.values[index]]['Background Color'],
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage(modImages[Mod.values[index]]),
                  ),
                ),
              ),
            ),
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      ),
    );
  }
}
