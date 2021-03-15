import 'package:flutter/material.dart';
import 'package:mega_cards/Domian/Models/Card.dart';

class NormalCard extends StatelessWidget {
  const NormalCard(
      {this.card, this.height, this.width, this.faceColor, this.withAnime});
  //Variables
  //==================================
  //==================================
  final GameCard card;
  final double height, width;
  final Color faceColor;
  final bool withAnime;
  //==================================
  //==================================
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(width: 3, color: Colors.grey),
      ),
      child: Container(
        margin: EdgeInsets.all((withAnime) ? 10 : 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        child: Center(
          child: Container(
            width: (withAnime) ? null : width - 30,
            height: (withAnime) ? null : height - 30,
            child: (withAnime) ? null : SizedBox(),
            decoration: BoxDecoration(
              shape: (withAnime) ? BoxShape.rectangle : BoxShape.circle,
              color: Colors.transparent,
              image: DecorationImage(image: AssetImage(card.image)),
            ),
          ),
        ),
      ),
    );
  }
}

// class AnimeCard extends StatelessWidget {
//   const AnimeCard({this.card, this.height, this.width, this.faceColor});
//   final GameCard card;
//   final double height, width;
//   final Color faceColor;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       width: width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5),
//         color: faceColor,
//         border: Border.all(width: 1, color: Colors.grey),
//       ),
//       child: Container(
//         margin: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           image: DecorationImage(image: AssetImage(card.image)),
//           color: Colors.transparent,
//         ),
//       ),
//     );
//   }
// }

class BackCard extends StatelessWidget {
  const BackCard({this.height, this.width});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 2, color: Colors.grey),
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage('Images/BackGround.jpg')),
      ),
    );
  }
}
