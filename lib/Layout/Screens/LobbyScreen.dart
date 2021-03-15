import 'package:flutter/material.dart';
import 'package:mega_cards/Domian/UseCases/Game.dart';
import 'package:mega_cards/Layout/Screens/GameScreen.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:mega_cards/Layout/Widgets/AppDrawer.dart';
import 'package:mega_cards/Layout/Widgets/AppMods.dart';
import 'package:provider/provider.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({Key key}) : super(key: key);

  @override
  _LobbyScreenState createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  GlobalKey<ScaffoldState> lobbyScreenKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeHandler>(context);
    return Scaffold(
      key: lobbyScreenKey,
      //================================================
      //================================================
      backgroundColor: theme.theme['Container Color'],
      //================================================
      //================================================
      drawer: appDrawer(theme.theme, context, theme.currentMod, theme.mode),
      //================================================
      //================================================
      appBar: AppBar(
        backgroundColor: theme.theme['Container Color'],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: theme.theme['Color 1'],
          ),
          onPressed: () => lobbyScreenKey.currentState.openDrawer(),
        ),
      ),
      //================================================
      //================================================
      body: ClipPath(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: theme.theme['Background Color'],
          child: Padding(
            padding: const EdgeInsets.only(
              left: 70,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //==================================
                //==================================
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 60,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: theme.theme['Container Color'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Game\t2x2",
                        style: TextStyle(
                          color: theme.theme['Color 1'],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      var game = Game_4(
                          modImagesPaths[theme.currentMod], theme.currentMod);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => game.handler,
                            child: GameScreen(
                              gameController: game,
                              theme: theme.theme,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //==================================
                //==================================
                SizedBox(
                  height: 50,
                ),
                //==================================
                //==================================
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 60,
                  child: TextButton(
                    // color: theme.theme['Container Color'],
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(5),
                    // ),
                    style: TextButton.styleFrom(
                      backgroundColor: theme.theme['Container Color'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      var game = Game_8(
                          modImagesPaths[theme.currentMod], theme.currentMod);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => game.handler,
                            child: GameScreen(
                              gameController: game,
                              theme: theme.theme,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Game\t4x2",
                        style: TextStyle(
                          color: theme.theme['Color 1'],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                //==================================
                //==================================
                SizedBox(
                  height: 50,
                ),
                //==================================
                //==================================
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 60,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: theme.theme['Container Color'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      var game = ScoreGame_16(
                          modImagesPaths[theme.currentMod], theme.currentMod);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                            create: (context) => game.handler,
                            child: GameScreen(
                              gameController: game,
                              theme: theme.theme,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Game\t4x4",
                        style: TextStyle(
                          color: theme.theme['Color 1'],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        clipper: LobbyCustomClipper(),
      ),
    );
  }
}

class LobbyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 90);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(70, 0);
    path.lineTo(0, 90);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
