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
  String _data = '';

  // initState は、このオブジェクトが画面（Widget tree）に追加された時に呼び出され、
  // 初期化処理などを記述できます
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final res = await http.get('https://api.github.com/repositories/31792824/issues');
    // setState によって状態が変わったことをFlutterに伝える
    setState(() {
      _data = res.body;
    });
  }

  @override
  Widget build(BuildContext context) { // ここの戻り値が画面に表示される
    return Scaffold( // 典型的な画面レイアウトを構築する便利なWidget
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(_data),
    );
  }
}
