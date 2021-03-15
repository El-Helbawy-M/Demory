import 'package:flutter/material.dart';
import 'package:mega_cards/Data/Sources/Repositry.dart';
import 'package:mega_cards/Data/Sources/UserData.dart';
import 'package:mega_cards/Layout/Screens/LobbyScreen.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:mega_cards/Layout/Widgets/AppDialogs.dart';
import 'package:mega_cards/Layout/Widgets/AppDrawer.dart';
import 'package:mega_cards/Layout/Widgets/AppMods.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeHandler>(context);
    return Scaffold(
      backgroundColor: theme.theme['Background Color'],
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                color: theme.theme['Container Color'],
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 30),
                  width: 180,
                  height: 180,
                  child: Container(
                    margin: (theme.currentMod == Mod.Dark ||
                            theme.currentMod == Mod.Normal)
                        ? EdgeInsets.all(10)
                        : null,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(modImages[theme.currentMod]),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.theme['Background Color'],
                  ),
                ),
              ),
              clipper: RegisterCustomClipper(),
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                controller: userNameController,
                style: TextStyle(color: theme.theme['Color 2']),
                decoration: InputDecoration(
                  labelText: 'User Name',
                  labelStyle: TextStyle(color: theme.theme['Color 2']),
                  enabledBorder: kRegisterTextFieldBorder(Colors.grey),
                  focusedBorder:
                      kRegisterTextFieldBorder(theme.theme['Color 2']),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Container(
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: theme.theme['Color 1'],
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                color: theme.theme['Container Color'],
                onPressed: () async {
                  bool check1;
                  showDialog(
                    context: context,
                    builder: (context) => indicatorDialog,
                  );
                  while (check1 == null) {
                    check1 = await register(userNameController.text);
                  }
                  Navigator.pop(context);
                  if (check1) {
                    insertData({
                      'name': userNameController.text,
                      'gameplayed': 0,
                      'bestscore': 0,
                      'wining': 0,
                      'losing': 0
                    }, 'bestscores');
                    smartNavigator(context, theme.mode, LobbyScreen());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 250);
    path.lineTo(size.width, size.height + 50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}

OutlineInputBorder kRegisterTextFieldBorder(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(width: 1, color: color),
    );
