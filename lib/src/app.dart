import 'package:flutter/material.dart';
import 'package:testapp/src/pages/home/home.dart';
import 'package:testapp/src/pages/setting/setting.dart';
import 'package:testapp/src/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TEST",
      routes: AppRoute.all,
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    Homepage(),
    Settingpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101F3D),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            size: 40,
            color: Color(0xff82E2F7),
          ),
        ),
        backgroundColor: const Color(0xff101F3D),
        leadingWidth: 100,
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "BLEED F4NKT",
            style: TextStyle(
              color: Color(0xffFFFFFF),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/logo.jpg',
                width: 50,
                height: 50,
                alignment: Alignment.centerRight,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 45, right: 25, left: 25, top: 55),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xff26457B),
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            currentIndex: myIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 35,
                ),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 35,
                ),
                label: "setting",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
