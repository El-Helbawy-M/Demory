import 'package:flutter/cupertino.dart';
import 'package:mega_cards/Data/Sources/UserData.dart';
import 'package:mega_cards/Domian/Models/Card.dart';
import 'package:mega_cards/Layout/Widgets/AppMods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Handler extends ChangeNotifier {
  int _minutes, _seconds, counter;
  List<GameCard> cards = [];
  //============================== Functions
  fillFields(int minutes, int seconds) {
    this._minutes = minutes;
    this._seconds = seconds;
    notifyListeners();
  }

  remove(int index) {
    this.cards[index] = null;
    this.counter--;
    notifyListeners();
  }

  frezzCards() {
    this.cards = this.cards.map((card) {
      if (card != null) card.frezz(false);
      return card;
    }).toList();
    notifyListeners();
  }

  unfrezzCards() {
    if (this.cards.isNotEmpty) {
      cards = cards.map((card) {
        if (card != null) card.frezz(true);
        return card;
      }).toList();
    }
    notifyListeners();
  }
  //==============================End

  //============================== Setters
  set setMinutes(int minutes) {
    this._minutes = minutes;
    notifyListeners();
  }

  set setSeconds(int seconds) {
    this._seconds = seconds;
    notifyListeners();
  }

  set setLength(int length) {
    this.counter = length;
    notifyListeners();
  }
  //============================== End

  //============================== Getters
  get minutes => this._minutes;
  get seconds => this._seconds;
  //============================== End
}

class ThemeHandler extends ChangeNotifier {
  Mod defaultMod = Mod.Normal, currentMod;
  Map<String, Color> theme;
  String imagesPath, mode;
  ThemeHandler(String mod) {
    mode = mod;
    (mod == '') ? currentMod = defaultMod : currentMod = mods[mod];
    theme = themeData[currentMod];
    imagesPath = modImages[currentMod];
  }

  set setMod(Mod mod) {
    currentMod = mod;
    mode = mods.keys.toList()[mods.values.toList().indexOf(mod)];
    theme = themeData[mod];
    imagesPath = modImages[mod];
    saveMod(mods.keys.elementAt(mods.values.toList().indexOf(mod)));
    notifyListeners();
  }
}
