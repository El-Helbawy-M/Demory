import 'package:flutter/material.dart';
import 'package:mega_cards/Data/Sources/Repositry.dart';
import 'package:mega_cards/Data/Sources/UserData.dart';
import 'package:mega_cards/Layout/Screens/AvatarsScreen.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:provider/provider.dart';

import 'RegisterScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeHandler>(context);
    return Scaffold(
      backgroundColor: theme.theme['Background Color'],
      //=====================================
      //=====================================
      appBar: AppBar(
        backgroundColor: theme.theme['Container Color'],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: theme.theme['Color 1'],
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: PopupMenuButton<String>(
              color: theme.theme['Background Color'],
              icon: Icon(
                Icons.settings,
                color: theme.theme['Color 1'],
              ),
              itemBuilder: (context) => List.generate(
                2,
                (index) => PopupMenuItem<String>(
                  textStyle: TextStyle(
                    color: theme.theme['Container Color'],
                    fontWeight: FontWeight.w900,
                  ),
                  value: (index == 0) ? 'Change Avatar' : "Sign Out",
                  child: Text(
                    (index == 0) ? 'Change Avatar' : "Sign Out",
                  ),
                ),
              ),
              onSelected: (val) async {
                if (val == 'Change Avatar') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => ThemeHandler(theme.mode),
                        child: AvatarsScreen(),
                      ),
                    ),
                  ).then((value) => setState(() {}));
                } else {
                  await signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => ThemeHandler(''),
                        child: RegisterScreen(),
                      ),
                    ),
                    (route) => false,
                  );
                }
              },
            ),
          ),
        ],
      ),
      //=====================================
      //=====================================
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: theme.theme['Container Color'],
                  ),
                  clipper: ProfileCustomClipper(),
                ),
                Positioned(
                  bottom: -50,
                  child: Container(
                    width: 150,
                    height: 150,
                    // child: Center(
                    //   child: Icon(
                    //     Icons.person,
                    //     color: Colors.grey,
                    //     size: 50,
                    //   ),
                    // ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(((avatar == '')
                              ? 'Avatars/avatar (5).png'
                              : avatar)),
                        ),
                        color: theme.theme['Background Color'],
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.theme['Background Color'],
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
                future: getDataWithName('bestscores'),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    Map<String, dynamic> data = snapshot.data.first;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 70, right: 30, left: 30),
                          child: Text(
                            data['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: theme.theme['Profile Name Color'],
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  StatisticsElement(
                                    label: 'Game Played',
                                    value: data['gameplayed'].toString(),
                                    theme: theme.theme,
                                  ),
                                  StatisticsElement(
                                    label: 'Wining',
                                    value: data['wining'].toString(),
                                    theme: theme.theme,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  StatisticsElement(
                                    label: 'Best Score',
                                    value: "${data['bestscore'].toString()}s",
                                    theme: theme.theme,
                                  ),
                                  StatisticsElement(
                                    label: 'Losing',
                                    value: data['losing'].toString(),
                                    theme: theme.theme,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else
                    return Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}

class StatisticsElement extends StatelessWidget {
  const StatisticsElement({
    @required this.label,
    @required this.value,
    @required this.theme,
  });
  final String label, value;
  final theme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(label,
              style: TextStyle(
                  color: theme['Color 2'],
                  fontSize: 22,
                  fontWeight: FontWeight.w900)),
          Container(
            height: 40,
            width: 140,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: theme['Container Color'],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(value,
                  style: TextStyle(
                      color: theme['Color 1'],
                      fontSize: 25,
                      fontWeight: FontWeight.w900)),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
