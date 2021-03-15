import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mega_cards/Data/Sources/UserData.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:mega_cards/Layout/Widgets/AppMods.dart';
import 'package:provider/provider.dart';

class OpenScreen extends StatefulWidget {
  OpenScreen({Key key}) : super(key: key);

  @override
  _OpenScreenState createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> with TickerProviderStateMixin {
  AnimationController controller, controller2;
  Animation animation, animation2;
  bool check = false;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    animation = Tween(begin: 250.0, end: 170.0).animate(controller);
    animation2 = Tween(begin: 170.0, end: 150.0).animate(controller2);
    controller.forward().whenComplete(
          () => setState(
            () {
              check = true;
              bool checkRegister = false;
              controller2.repeat(reverse: true);
              checkRegister = containName;
              Timer.periodic(Duration(seconds: 5), (timer) {
                timer.cancel();
                controller2.dispose();
                controller.dispose();
                (checkRegister)
                    ? Navigator.pushReplacementNamed(context, 'LobbyScreen')
                    : Navigator.pushReplacementNamed(context, 'RegisterScreen');
              });
            },
          ),
        );
    controller.addListener(() => setState(() {}));
    controller2.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeHandler>(context);
    return Scaffold(
      backgroundColor: theme.theme["Background Color"],
      //=================================
      //=================================
      body: Center(
        child: Container(
          width: (!check) ? animation.value + 1 : animation2.value,
          height: (!check) ? animation.value : animation2.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: (theme.currentMod == Mod.DetectiveConan ||
                    theme.currentMod == Mod.Naruto)
                ? null
                : Border.all(width: 2, color: Colors.grey),
          ),
          child: Center(
            child: Container(
              width: (!check) ? 340 - animation.value : animation2.value,
              height: (!check) ? 340 - animation.value : animation2.value,
              child: Container(
                margin: (theme.currentMod != Mod.Normal &&
                        theme.currentMod != Mod.Dark)
                    ? null
                    : EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(modImages[theme.currentMod]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
