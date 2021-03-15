import 'package:flutter/material.dart';
import 'package:mega_cards/Data/Sources/Repositry.dart';
import 'package:mega_cards/Layout/State%20Management/State%20Handeler.dart';
import 'package:mega_cards/Layout/Widgets/AppDialogs.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    //===================================================
    //===================================================
    var theme = Provider.of<ThemeHandler>(context);
    TextStyle textHistoryStyle =
        TextStyle(color: theme.theme['Profile Name Color']);
    List<Map<String, dynamic>> history = [];
    //===================================================
    //===================================================
    return Scaffold(
      backgroundColor: theme.theme['Background Color'],
      //====================================
      //====================================
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
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            color: theme.theme['Container Color'],
            onPressed: () async {
              bool check;
              showDialog(
                context: context,
                builder: (context) => indicatorDialog,
              );
              while (check == null) check = await deleteData();
              Navigator.pop(context);
              setState(() {});
            },
          )
        ],
      ),
      //====================================
      //====================================
      body: Column(
        children: [
          Divider(
            thickness: 10,
            height: 30,
            color: theme.theme['Container Color'],
          ),
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                'Name',
                style: textHistoryStyle,
              ))),
              Expanded(
                  child: Center(
                      child: Text(
                'Result',
                style: textHistoryStyle,
              ))),
              Expanded(
                  child: Center(
                      child: Text(
                'Score',
                style: textHistoryStyle,
              ))),
              Expanded(
                child: Center(
                  child: Text(
                    'Date',
                    style: textHistoryStyle,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 10,
            height: 30,
            color: theme.theme['Container Color'],
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: getData('history'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      history = snapshot.data;
                      return Column(
                        verticalDirection: VerticalDirection.up,
                        children: history
                            .map(
                              (map) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(children: [
                                      Text(
                                        map['name'],
                                        textAlign: TextAlign.center,
                                        style: textHistoryStyle,
                                      )
                                    ])),
                                    Expanded(
                                        child: Column(children: [
                                      Text(
                                        map['state'],
                                        textAlign: TextAlign.center,
                                        style: textHistoryStyle,
                                      )
                                    ])),
                                    Expanded(
                                        child: Column(children: [
                                      Text(
                                        map['score'].toString(),
                                        textAlign: TextAlign.center,
                                        style: textHistoryStyle,
                                      )
                                    ])),
                                    Expanded(
                                        child: Column(children: [
                                      Text(
                                        map['date'],
                                        textAlign: TextAlign.center,
                                        style: textHistoryStyle,
                                      )
                                    ])),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      );
                    } else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
