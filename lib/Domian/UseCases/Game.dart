import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mega_cards/Domian/Models/Card.dart';
import 'package:mega_cards/Domian/Models/GameState.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:mega_cards/Layout/Widgets/AppDialogs.dart';
import 'package:mega_cards/Layout/Widgets/AppMods.dart';
import 'package:mega_cards/Layout/Widgets/GameElements.dart';

abstract class Game {
  //======================== Fields
  List<GameCard> cards = [];
  int length;
  Timer _timeController;
  GameState _gameState;
  GameLevel _level;
  Handler handler = Handler();
  Mod currentMod;

  //======================== End

  //======================== Functions
  start(BuildContext context, Map theme) async {
    this._timeController = Timer.periodic(
      Duration(milliseconds: 700),
      (timer) {
        (mechanism[this._level] == GameMechanism.Score)
            ? _score(context, theme)
            : _timer(context, theme);
        handler.fillFields(minutes, seconds);
      },
    );
  }

  pause() => this._timeController.cancel();
  end(PlayerState state) {}
  Map getData(String playerName) => _gameState.getGameState(playerName);
  _setCards(String path) {}
  _sortCards() {}
  _timer(BuildContext context, Map theme) {
    this._gameState.runTimer();
    if (this._gameState.gameOver()) {
      end(PlayerState.Lose);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => loseDialog(context, theme),
      ).then((value) => Navigator.pop(context));
    } else if (this.handler.counter == 0) {
      end(PlayerState.Win);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => winDialog(context, theme),
      ).then((value) => Navigator.pop(context));
    }
  }

  _score(BuildContext context, Map theme) {
    this._gameState.runTimeScore();
    if (this.handler.counter == 0) {
      end(PlayerState.Win);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => winDialog(context, theme),
      ).then((value) => Navigator.pop(context));
    }
  }
  //======================== End

  //======================== Getters
  get level => _level;
  get minutes => this._gameState.minutes;
  get seconds => this._gameState.seconds;
  //========================End
}

// ignore: camel_case_types
class Game_4 extends Game {
  Game_4(String imagePath, Mod currentMod) {
    _setCards(imagePath);
    _sortCards();
    _level = GameLevel.Game2x2;
    this._gameState = GameState(time: 120, minutes: 2, seconds: 0);
    this.handler.fillFields(2, 00);
    this.currentMod = currentMod;
  }

  //============================= Functions
  @override
  _setCards(String path) {
    List list = List.generate(10, (index) => index + 1);
    for (int x = 0; x < 2; x++) {
      int number = Random().nextInt(list.length);
      this.cards.add(GameCard(image: "$path${list[number]}.png"));
      this.cards.add(GameCard(image: "$path${list[number]}.png"));
      list.removeAt(number);
    }
    super._setCards(path);
  }

  @override
  _sortCards() {
    int length = cards.length;
    this.handler.setLength = cards.length;
    this.length = cards.length;
    for (int x = 0; x < length; x++) {
      int ind = Random().nextInt(cards.length);
      this.handler.cards.add(cards[ind]);
      this.cards.removeAt(ind);
    }
    return super._sortCards();
  }

  @override
  end(PlayerState state) {
    this._timeController.cancel();
    if (state == PlayerState.Win) {
      this
          ._gameState
          .finishGame("Win", this._gameState.time, mechanism[this._level]);
    } else {
      this._gameState.finishGame("Lose", 0, mechanism[this._level]);
    }
    return super.end(state);
  }
  //============================= End

}

// ignore: camel_case_types
class Game_8 extends Game {
  Game_8(String imagePath, Mod currentMod) {
    _setCards(imagePath);
    _sortCards();
    _level = GameLevel.Game4x2;
    this._gameState = GameState(time: 300, minutes: 5, seconds: 0);
    this.handler.fillFields(5, 0);
    this.currentMod = currentMod;
  }

  //============================= Functions
  @override
  _setCards(String path) {
    List list = List.generate(10, (index) => index + 1);
    for (int x = 0; x < 4; x++) {
      int number = Random().nextInt(list.length);
      this.cards.add(GameCard(image: "$path${list[number]}.png"));
      this.cards.add(GameCard(image: "$path${list[number]}.png"));
      list.removeAt(number);
    }
    super._setCards(path);
  }

  @override
  _sortCards() {
    int length = cards.length;
    this.handler.setLength = cards.length;
    this.length = cards.length;
    for (int x = 0; x < length; x++) {
      int ind = Random().nextInt(cards.length);
      this.handler.cards.add(cards[ind]);
      this.cards.removeAt(ind);
    }
    return super._sortCards();
  }

  @override
  end(PlayerState state) {
    this._timeController.cancel();
    if (state == PlayerState.Win) {
      this
          ._gameState
          .finishGame("Win", this._gameState.time, mechanism[this._level]);
    } else {
      this._gameState.finishGame("Lose", 0, mechanism[this._level]);
    }
    return super.end(state);
  }
  //============================= End

}

class ScoreGame_16 extends Game {
  ScoreGame_16(String imagePath, Mod currentMod) {
    _setCards(imagePath);
    _sortCards();
    _level = GameLevel.ScoreGame_4x4;
    this._gameState = GameState(time: 0, minutes: 0, seconds: 0);
    this.handler.fillFields(0, 0);
    this.currentMod = currentMod;
  }
  @override
  _setCards(String path) {
    List list = List.generate(10, (index) => index + 1);
    for (int x = 0; x < 8; x++) {
      int number = Random().nextInt(list.length);
      this.cards.add(GameCard(image: "$path${list[number]}.png"));
      this.cards.add(GameCard(image: "$path${list[number]}.png"));
      list.removeAt(number);
    }
    return super._setCards(path);
  }

  @override
  _sortCards() {
    int length = cards.length;
    this.handler.setLength = cards.length;
    this.length = cards.length;
    for (int x = 0; x < length; x++) {
      int ind = Random().nextInt(cards.length);
      this.handler.cards.add(cards[ind]);
      this.cards.removeAt(ind);
    }
    return super._sortCards();
  }

  @override
  end(PlayerState state) {
    this._timeController.cancel();
    this
        ._gameState
        .finishGame("Win", this._gameState.time, mechanism[this._level]);
    return super.end(state);
  }
}
