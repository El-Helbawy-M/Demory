import 'package:flutter/material.dart';
import 'package:mega_cards/Data/Sources/UserData.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:provider/provider.dart';

class AvatarsScreen extends StatefulWidget {
  AvatarsScreen({Key key}) : super(key: key);

  @override
  _AvatarsScreenState createState() => _AvatarsScreenState();
}

class _AvatarsScreenState extends State<AvatarsScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeHandler>(context);
    return Scaffold(
      backgroundColor: theme.theme['Background Color'],
      //=========================================
      //=========================================
      appBar: AppBar(
        backgroundColor: theme.theme['Background Color'],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: theme.theme['Container Color'],
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      //=========================================
      //=========================================
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setAvatar = 'Avatars/avatar (${index + 1}).png';
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(23),
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('Avatars/avatar (${index + 1}).png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
