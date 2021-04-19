import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;
  late TextEditingController _textEditingController;

  String text = "";

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Text Editor", style: style),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              child: Text("Editing", style: style),
            ),
            Tab(
              child: Text("Preview", style: style),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: _textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Input here!!"),
              onChanged: (String text) {
                setState(
                  () {
                    this.text = text;
                  },
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: MarkdownBody(
              data: text,
            ),
          ),
        ],
      ),
    );
  }
}
