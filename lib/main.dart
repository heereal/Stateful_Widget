import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 실시간으로 변하는 데이터를 보고 싶을 때 StatefulWidget 사용
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 플러터에서 데이터 = Dart의 클래스 프로퍼티
  List<int> numbers = [];

  void onClicked() {
    // setState 함수를 호출해서 플러터 위젯에게 새로운 데이터가 있다고 알려 줌
    // -> build 메서드 재실행 (UI 업데이트)
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme으로 앱의 모든 스타일을 한 곳에서 지정할 수 있음
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  // context는 위젯 트리의 모든 부모 요소들에 대한 정보를 담고 있음
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        // context를 통해 부모 위젯의 Theme에 접근
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
