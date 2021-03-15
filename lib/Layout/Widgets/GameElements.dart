import 'package:flutter/cupertino.dart';

enum GameLevel {
  Game2x2,
  Game4x2,
  ScoreGame_4x4,
}

enum GameMechanism {
  Score,
  Timer,
}

Map<GameLevel, List<double>> cardSize = {
  GameLevel.Game2x2: [200, 100, 2],
  GameLevel.Game4x2: [170, 85, 2],
  GameLevel.ScoreGame_4x4: [140, 70, 2]
};

Map<GameLevel, GameMechanism> mechanism = {
  GameLevel.Game2x2: GameMechanism.Timer,
  GameLevel.Game4x2: GameMechanism.Timer,
  GameLevel.ScoreGame_4x4: GameMechanism.Score,
};
