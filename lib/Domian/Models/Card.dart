class GameCard {
  GameCard({String image}) {
    _image = image;
  }
  //============================= Fields
  bool _flipped = true;
  String _image;
  //============================= End

  //============================= Functions
  void flip() => _flipped = !_flipped;
  bool isEqual(GameCard card) => _image == card.image;
  void frezz(bool value) => _flipped = value;
  //============================= End

  //============================= Getter
  String get image => _image;
  bool get flipped => _flipped;
  //============================= End
}
