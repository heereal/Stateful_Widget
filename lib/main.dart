import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 플러터에서 데이터 = Dart의 클래스 프로퍼티
  List<int> numbers = [];
  bool showTitle = true;

  void clickCount() {
    // setState 함수를 호출해서 플러터 위젯에게 새로운 데이터가 있다고 알려 줌
    // -> build 메서드 재실행 (UI 업데이트)
    setState(() {
      numbers.add(numbers.length);
    });
  }

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme으로 앱의 모든 스타일을 한 곳에서 지정할 수 있음
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle
                  ? const MyLargeTitle()
                  : const Text(
                      'nothing',
                    ),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(
                  Icons.remove_red_eye,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 실시간으로 변하는 데이터를 보고 싶을 때 StatefulWidget 사용
// Stateful Widget은 Widget Lifecycle을 가지고 있으며 이벤트에 반응함
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0; // 이런 식으로도 상태를 초기화 할 수 있음

  @override
  // 부모 요소에 의존하는 데이터를 초기화할 때 사용하는 메소드
  // initState 메소드는 항상 build 메소드보다 먼저 호출됨
  // initState 메소드는 단 한 번만 호출됨
  void initState() {
    super.initState();
    print('initState');
  }

  // 위젯이 위젯 트리에서 제거될 때 호출되는 메소드
  // 위젯이 위젯 트리에서 제거되기 전에 무언가를 취소할 수 있음 (ex. 이벤트 리스너 구독 취소)
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  // context는 위젯 트리의 모든 부모 요소들에 대한 정보를 담고 있음
  Widget build(BuildContext context) {
    print('build');

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
