import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { // StatelessWidget を継承しており、 Widget である
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { // ここの戻り値が画面に表示される
    return MaterialApp( // マテリアルデザインのアプリを作るために便利なWidget
      title: 'Flutter Issues',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Issues'),
    );
  }
}

class MyHomePage extends StatefulWidget { // StatefulWidget. 状態がある. 状態は_MyHomePageState
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      //  setState メソッドの呼び出しによって、Flutterフレームワークに対して「状態が変わった」ことが伝わります。
//      //  Flutterフレームワークは、このあとで build メソッドを呼び出すことで画面を最新の状態に更新します。
//
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter += 2;
////      _counter++;
//    });
//  }

  @override
  Widget build(BuildContext context) { // ここの戻り値が画面に表示される
    return Scaffold( // 典型的な画面レイアウトを構築する便利なWidget
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        '空っぽの画面'
      ),
    );
  }
}
