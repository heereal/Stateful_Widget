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
  int counter = 0;
  void onClicked() {
    counter = counter + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              IconButton(
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_circle,
                ),
                iconSize: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
