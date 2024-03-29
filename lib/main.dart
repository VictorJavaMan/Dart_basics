// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:my_flutter/algebra.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = "";

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;

      // DelimetersCalculator delimetersCalculator = new DelimetersCalculator();
      // _counter = delimetersCalculator.nod(6, 4);

      // BinaryCalculator binaryCalculator = new BinaryCalculator();
      // _counter = binaryCalculator.binaryToDecimal("1001").toString();

      //StringCalculator stringCalculator = new StringCalculator();
      //_counter = stringCalculator.stringToNumArray("asas -224333 h tyrh 64.896 hghgfhf ww 6").join(", ");
      //stringCalculator.stringToMap("rthrh gmjyujy rthrh ilkll gmjyujy hfghfh gmjyujy");
      //_counter = stringCalculator.stringToDigit("one, two, zero, zero", ", ").join(", ");

      //_counter = Point(4, 8, 1).distanceTo(Point(5, 2, 3)).toString();
      //_counter = Point(4, 8, 1).areaOfATriangle(Point(5, -2, 3), Point(8, 23, 2)).toString();
      //_counter = 3.pow(7).toString();
      //_counter = RiemannIntegral().integral((p0) => p0 * p0, -7, 12.0, 1000000).toString();
      //_counter = AdminUser().getMail();
      var userManager = UserManager();
      userManager.addUser(AdminUser("vasiliy@bu.ru"));
      userManager.addUser(AdminUser("karl@slom.ru"));
      userManager.addUser(GeneralUser("artas@fan.com"));
      userManager.addUser(AdminUser("momo_skolk@fill.ru"));
      userManager.addUser(GeneralUser("parter@gorg.bk"));
      userManager.addUser(AdminUser("valander@rost.com"));
      _counter = userManager.showUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'IMAGES'//'You have pushed the button this many times:',
            ),
            Text(
              _counter,
              style: Theme.of(context).textTheme.headline4,
            ),
            //Image.asset('assets/images/mordor.jpg'),
            SvgPicture.asset(
                'assets/images/123.svg',
            ),
            //SvgPicture.network('https://infogra.ru/wp-content/themes/infogra.loc/assets/img/logo.svg'),
            CarouselSlider(
              options: CarouselOptions(height: 100.0),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        decoration: const BoxDecoration(
                            color: Colors.lightGreenAccent
                        ),
                        child: SvgPicture.network('https://infogra.ru/wp-content/themes/infogra.loc/assets/img/logo.svg')//Text('text $i', style: TextStyle(fontSize: 16.0),)
                    );
                  },
                );
              }).toList(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
