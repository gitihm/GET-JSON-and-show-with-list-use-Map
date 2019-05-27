import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:getdata/store.dart';
import 'package:getdata/responedisplay.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        builder: (_)=>Store(),
        child: MyHomePage(title: 'GET'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Center(
                  child: RaisedButton(
                    onPressed: store.fetchData,
                    child: Text("GETDATA"),
                  ),
                ),
                ResponseDisplay(),

          ],
        ),
      ),
    );
  }
}
