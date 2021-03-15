// import 'package:cards/Data/Sources/Repositry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mega_cards/Layout/Screens/ChangeModScreen.dart';
import 'package:provider/provider.dart';
import 'Data/Sources/Repositry.dart';
import 'Data/Sources/UserData.dart';
import 'Layout/Screens/AvatarsScreen.dart';
import 'Layout/Screens/FastScreen.dart';
import 'Layout/Screens/HistoryScreen.dart';
import 'Layout/Screens/LobbyScreen.dart';
import 'Layout/Screens/OpenScreen.dart';
import 'Layout/Screens/ProfileScreen.dart';
import 'Layout/Screens/RegisterScreen.dart';
import 'Layout/State Management/State Handeler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mod = '', check;
  Future<String> fillMod() async => mod = await getSavedMod();

  @override
  void initState() {
    super.initState();
    createDB();
    linkCache();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await fillMod();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "FastScreen": (context) => FastScreen(),
        "OpenScreen": (context) => ChangeNotifierProvider(
              create: (context) => ThemeHandler(mod),
              child: OpenScreen(),
            ),
        "LobbyScreen": (context) => ChangeNotifierProvider(
              create: (context) => ThemeHandler(mod),
              child: LobbyScreen(),
            ),
        "RegisterScreen": (context) => ChangeNotifierProvider(
              create: (context) => ThemeHandler(mod),
              child: RegisterScreen(),
            ),
      },
      initialRoute: 'FastScreen',
    );
  }
}

// class CatLogo extends StatelessWidget {
//   const CatLogo({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: 150,
//           height: 150,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: AssetImage("Images/Cat Reloaded Logo.png"),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Animate1 extends StatefulWidget {
//   Animate1({Key key}) : super(key: key);

//   @override
//   _Animate1State createState() => _Animate1State();
// }

// class _Animate1State extends State<Animate1>
//     with SingleTickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> a;
//   int c = 0, i;
//   String str;
//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(
//         seconds: 1,
//       ),
//     );
//     a = Tween<double>(begin: 0, end: 40).animate(controller);
//     controller.addListener(
//       () {
//         setState(() {});
//       },
//     );
//     super.initState();
//   }

//   double heigh = 120, width = 60;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(
//             list.length,
//             (index) => (list[index])
//                 ? MCard(
//                     width: width,
//                     heigh: heigh,
//                     fun: () {
//                       setState(() {
//                         if (c == 0) {
//                           i = index;
//                           str = "Images/7.png";
//                           c++;
//                           print(c);
//                         } else {
//                           Timer(
//                             Duration(milliseconds: 500),
//                             () => setState(
//                               () {
//                                 if ("Images/7" == str &&
//                                     i != index) {
//                                   list[index] = list[i] = false;
//                                   str = "";
//                                   i = null;
//                                   c = 0;
//                                 }
//                               },
//                             ),
//                           );
//                         }
//                       });
//                     },
//                   )
//                 : SizedBox(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MCard extends StatelessWidget {
//   const MCard({
//     Key key,
//     @required this.width,
//     @required this.heigh,
//     @required this.fun,
//   }) : super(key: key);

//   final double width;
//   final double heigh;
//   final Function fun;

//   @override
//   Widget build(BuildContext context) {
//     return FlipCard(
//       direction: FlipDirection.HORIZONTAL,
//       flipOnTouch: true,
//       onFlip: fun,
//       front: Container(
//         width: width,
//         height: heigh,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: Colors.black,
//             width: 1,
//           ),
//         ),
//       ),
//       back: Container(
//         width: width,
//         height: heigh,
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Center(
//             child: Image.asset("Images/7.png"),
//           ),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: Colors.grey,
//             width: 1,
//           ),
//         ),
//       ),
//     );
//   }
// }

// List<bool> list = [true, true, true, true];
// Map<int, List<int>> map = {
//   0: [0, 0],
//   2: [120, 0],
//   1: [0, 60],
//   3: [120, 60],
// };
