import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  List<String> _titles = <String>[];

  // initState は、このオブジェクトが画面（Widget tree）に追加された時に呼び出され、
  // 初期化処理などを記述できます
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final res = await http.get('https://api.github.com/repositories/31792824/issues');
    final data = json.decode(res.body);

    // setState によって状態が変わったことをFlutterに伝える
    setState(() {
      // API全体は List 、各要素は Map 、その中の title がタイトルです。
      // json.decodeの戻り値は型が dynamic と定まっていない（JSONの形式は不定なため）ので、
      // as キーワードによって List や Map にキャストしています。
      final issues = data as List;
      issues.forEach((dynamic element) {
        final issue = element as Map;
        _titles.add(issue['title'] as String);
      });
    });
  }

  @override
  Widget build(BuildContext context) { // ここの戻り値が画面に表示される
    return Scaffold( // 典型的な画面レイアウトを構築する便利なWidget
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        //リストの表示には ListView というWidgetを使います。 '
        // ListView.builder は、 ListView のクラスの名前付きコンストラクタです。
          itemBuilder: (BuildContext context, int index) {
            if (index >= _titles.length) {
              return null;
            }

            return ListTile(
              title: Text(_titles[index]),
            );
      }),
    );
  }
}
