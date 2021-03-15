import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:mega_cards/Layout/Widgets/AppMods.dart';
import 'package:mega_cards/Layout/Widgets/CardsWidgets.dart';
import 'package:mega_cards/Layout/Widgets/GameElements.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  GameScreen({@required this.gameController, @required this.theme});
  final gameController, theme;
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<GlobalKey<FlipCardState>> keys = [];
  // ignore: avoid_init_to_null
  GlobalKey<FlipCardState> checker = null;
  bool started = false;
  int checker2 = 0;
  @override
  void initState() {
    int length = widget.gameController.length;
    keys = List.generate(length, (index) => GlobalKey<FlipCardState>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var handler = Provider.of<Handler>(context);
    double height = cardSize[widget.gameController.level][0];
    double width = cardSize[widget.gameController.level][1];
    int length = (widget.gameController.length == 4) ? 2 : 4;
    return Scaffold(
      //====================================
      //====================================
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('Images/Game Screen Background.jpg'),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (started) widget.gameController.pause();
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: widget.theme['Container Color'],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            '${handler.minutes} : ${handler.seconds}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: (started)
                            ? SizedBox(
                                width: 24,
                              )
                            : IconButton(
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                ),
                                splashColor: Colors.grey,
                                splashRadius: 30,
                                color: Colors.white,
                                onPressed: () {
                                  if (!started) {
                                    widget.gameController
                                        .start(context, widget.theme);
                                    setState(() => started = true);
                                  }
                                },
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    (widget.gameController.length >= 16) ? 4 : 2,
                    (index) {
                      int ind = index;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(length, (index) {
                          int postion =
                              (ind == 0) ? index : index + (length * ind);
                          if (handler.cards[postion] != null) {
                            return FlipCard(
                              speed: 400,
                              key: keys[postion],
                              flipOnTouch: (started)
                                  ? handler.cards[postion].flipped
                                  : started, //keys.values.elementAt(postion),
                              front: BackCard(height: height, width: width),
                              back: NormalCard(
                                card: handler.cards[postion],
                                height: height,
                                width: width,
                                faceColor: widget.theme['Background Color'],
                                withAnime: (widget.gameController.currentMod ==
                                            Mod.DetectiveConan ||
                                        widget.gameController.currentMod ==
                                            Mod.Naruto ||
                                        widget.gameController.currentMod ==
                                            Mod.CatReloaded)
                                    ? true
                                    : false,
                              ),
                              onFlip: () {
                                if (checker == null) {
                                  setState(() {
                                    handler.cards[postion].flip();
                                    checker = keys[postion];
                                  });
                                } else if (checker2 == 0) {
                                  if (handler.cards[postion].isEqual(
                                      handler.cards[keys.indexOf(checker)])) {
                                    handler.frezzCards();
                                    Timer(
                                      Duration(milliseconds: 500),
                                      () => setState(() {
                                        handler.remove(postion);
                                        keys[postion] = null;
                                        handler.remove(keys.indexOf(checker));
                                        keys[keys.indexOf(checker)] = null;
                                        checker = null;
                                        handler.unfrezzCards();
                                      }),
                                    );
                                  } else {
                                    handler.frezzCards();
                                    Timer(
                                      Duration(milliseconds: 500),
                                      () => setState(() {
                                        checker2++;
                                        checker.currentState.toggleCard();
                                        keys[postion].currentState.toggleCard();
                                        handler.cards[keys.indexOf(checker)]
                                            .flip();
                                        checker2--;
                                        checker = null;
                                        handler.unfrezzCards();
                                      }),
                                    );
                                  }
                                }
                              },
                            );
                          } else
                            return SizedBox(
                              width: width,
                              height: height,
                            );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
