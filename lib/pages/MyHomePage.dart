import 'package:android_play_flutter/views/WrapFlowLayout.dart';
import 'package:android_play_flutter/views/toast.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

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
        home: Scaffold(
            body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Expanded(
                flex: 1,
                child: WrapFlowLayout(minLines: 2, data:
                ['111111', '2222', '11111', '1111😄', '1111', '11111', '222', '3333', '222' , '11111', '222', '3333', '222' ], onItemClick: (i){
                  print(i);
                },),
              ),
            ],
          ),
        )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.minLines})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  //最低显示多少行时
  final int minLines;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> resultList = [
    "测试数据1",
    "测232312试数据2",
    "测试1daa数据3",
    "测试4",
    "测试5",
    "测试数据6",
    "测试数12321312312据7",
    "测试数据8",
    "测试数据9",
    "测试数2323121313据10",
    "测试数据11",
    "测试数sadadadadaadadad据12"
  ];

  late int minLines;
  late int maxLines;
  bool isExpand = false;

  int noArrowMaxLines = 2;

  @override
  void initState() {
    super.initState();
    minLines = widget.minLines; // 首次赋值必须跟maxLines相等， 解决有overflowWidget 隐藏与展开问题
    maxLines = minLines;
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
        body: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(20),
          child: ExtendedWrap(
            maxLines: maxLines,
            minLines: minLines,
            runSpacing: 12,
            spacing: 12,
            alignment: WrapAlignment.start,
            children: resultList.map((e) => _itemView(e)).toList(),
            overflowWidget: _expandButton(),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _itemView(String text) {
    return GestureDetector(
      onTap: () {
        print("$text is click...");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        height: 30,
        decoration: BoxDecoration(
            color: Color(0xfff1f2f4),
            borderRadius: BorderRadius.all(Radius.circular(3))),
        child: Text(text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Color(0xff505051))),
      ),
    );
  }

  _expandButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpand = !isExpand;
          maxLines = (isExpand ? 8 : minLines);
        });
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
            isExpand
                ? "images/ic_love_pressed.png"
                : "images/ic_love_unpressed.png",
            width: 24,
            height: 24),
      ),
    );
  }
}
