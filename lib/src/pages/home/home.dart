import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:testapp/src/pages/data/data.dart';
import 'package:testapp/src/pages/sheet/bottomsheet.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  static final List<DataModel> _mockUp = [
    DataModel("HamHarry", "2.4 Ghz", true, 70),
    DataModel("Neng", "5 Ghz", false, 30),
    DataModel("TTXPZ", "2.4 Ghz", false, 100),
    DataModel("GGEZ", "2.4 Ghz", true, 50),
    DataModel("BU", "2.4 Ghz", true, 20),
    DataModel("BUMAIL", "5 Ghz", false, 90),
  ];

  List<DataModel> display_list = List.from(_mockUp);
  Timer? _debounce;

  void updateList(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      setState(() {
        display_list = _mockUp
            .where((element) =>
                element.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101F3D),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 20),
            child: TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(
                color: Color(0xffFFFFFF),
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                filled: true,
                fillColor: const Color(0xff253960),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Icon(
                    Icons.search,
                    size: 40,
                    color: Color(0xff5B7299),
                  ),
                ),
                hintText: "Search Settings, etc",
                hintStyle: const TextStyle(color: Color(0xff496BA5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final wifi = _mockUp[index];
                      double bat = display_list[index].number / 100;
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (ctx) => Sheet(
                                    mockUp: wifi,
                                  ));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                  color: Color(0xff254479),
                                ),
                                width: 400,
                                height: 100,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 35),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Text(
                                            display_list[index].name,
                                            style: const TextStyle(
                                              color: Color(0xffFFFFFF),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                display_list[index].network,
                                                style: const TextStyle(
                                                  color: Color(0xff678BCA),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Icon(
                                                  Icons.bluetooth,
                                                  size: 15,
                                                  color: Color(0xffFFFFFF),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    CircularPercentIndicator(
                                      radius: 30.0,
                                      lineWidth: 5,
                                      percent: bat,
                                      center: Text(
                                        "${display_list[index].number}%",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Color(0xfFFFFFFF)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: display_list.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Color(0xff254479),
                        ),
                        width: 400,
                        height: 100,
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 40),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
