import 'package:flutter/material.dart';
import 'package:testapp/src/pages/data/data.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  final List<DataModel> _mockUp = [
    DataModel("HamHarry", "2.4 Ghz", true),
    DataModel("Neng", "5 Ghz", false),
    DataModel("TTXPZ", "2.4 Ghz", false),
    DataModel("GGEZ", "2.4 Ghz", true),
    DataModel("BU", "2.4 Ghz", true),
    DataModel("BUMAIL", "5 Ghz", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              ((context, index) {
                return Container(child: Text(_mockUp[index].name));
              }),
              childCount: _mockUp.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Text("ez"),
          )
        ],
      ),
    );
  }
}
