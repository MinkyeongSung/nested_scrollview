import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  double prev = 0;
  double height = 300;
  double copacity = 0;

  @override
  void initState() {
    _controller.addListener(() {
      scrollListener();
    });
    super.initState();
  }

  void scrollListener() {
    print("스크롤 동작중");
    double currentOffset = _controller.offset;
    print("currentOffset : $currentOffset");

    // 실습
    if (currentOffset < 300) {}

    // 301              300
    if (currentOffset > prev) {
      // 아래방향
      print("아래로 내려가요");
    }

    // 300              301
    if (currentOffset < prev) {
      // 위방향
      print("위로 올라가요");
    }

    if (currentOffset == _controller.position.maxScrollExtent) {
      print("가장 하단");
    }

    // currentOffset == 0;
    if (currentOffset == _controller.position.minScrollExtent) {
      print("가장 위");
    }

    // // offset이 300보다 작을때 동작
    // if (currentOffset < 300) {
    //   if (currentOffset < prev) {
    //     // 위로 올라갈때 동작 (점점 드러남)
    //     print("나타나는중");
    //     setState(() {
    //       height = 300 - currentOffset;
    //     });
    //   }
    //   if (currentOffset > prev) {
    //     // 아래로 내려갈 때 동작 (점점 사라짐)
    //     print("사라지는중");
    //     setState(() {
    //       height = 300 - currentOffset;
    //     });
    //   }
    // }

    if (currentOffset < 300) {
      // 아래로 내려갈 때 동작 (점점 사라짐)
      print("사라지는중");
      setState(() {
        height = 300 - currentOffset - 56;
        // height = 0;
        copacity = (300 - currentOffset) / 300;
        if (height < 56) {
          height = 56;
        }
        // print("copacity : $copacity");
      });
    }

    prev = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color.fromRGBO(250, 0, 0, copacity),
              // color: Colors.red,
              height: height,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Good",
                  style: TextStyle(color: Colors.white, fontSize: height / 3),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: 50,
                itemBuilder: (context, index) => Text("제목 $index"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
