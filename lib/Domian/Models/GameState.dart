import 'package:flutter/cupertino.dart';
import 'package:mega_cards/Data/Sources/Repositry.dart';
import 'package:mega_cards/Data/Sources/UserData.dart';
import 'package:mega_cards/Layout/Widgets/GameElements.dart';

class GameState {
  GameState({
    @required int time,
    @required int seconds,
    @required int minutes,
  }) {
    this._time = time;
    this._minutes = minutes;
    this._seconds = seconds;
    this._startDate = DateTime.now();
  }
  //============================= Fields
  int _time, _seconds, _minutes, _timeScore;
  String _playState;
  DateTime _startDate;
  //============================= End

  //============================= Setter
  // set time(int val) => _time = val;
  // set seconds(int val) => _seconds = val;
  // set minutes(int val) => _minutes = val;
  //============================= End

  //============================= Getter
  get time => this._time;
  get minutes => this._minutes;
  get seconds => this._seconds;
  //============================= End

  //============================= Functions
  bool gameOver() => (this._time == 0) ? true : false;

  finishGame(String state, int timeScore, GameMechanism level) async {
    this._playState = state;
    this._timeScore = timeScore;
    insertData(getGameState(name), 'history');
    updateData({
      'state': state,
      'bestscore': (level == GameMechanism.Score) ? timeScore : 0
    });
  }

  Map<String, dynamic> getGameState(String playerName) => {
        "state": this._playState,
        "score": this._timeScore,
        "date":
            '${this._startDate.year} / ${this._startDate.month} / ${this._startDate.day}',
        "name": playerName,
      };

  runTimer() {
    this._time--;
    if (this._seconds == 0) {
      this._minutes--;
      this._seconds = 59;
    } else
      this._seconds--;
  }

  runTimeScore() {
    this._time++;
    if (this._seconds == 59) {
      this._minutes++;
      this._seconds = 0;
    } else
      this._seconds++;
  }
  //============================= End
}

enum PlayerState { Win, Lose }
