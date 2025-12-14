import 'package:flutter/material.dart';
import 'package:jige_basickit/jige_basickit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '模糊按钮示例',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BlurButtonDemo(),
    );
  }
}

class BlurButtonDemo extends StatelessWidget {
  const BlurButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 给按钮加背景图，突出模糊效果
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/1080/1920'), // 测试图片
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: BlurButton(
            width: 50,
            height: 50,
            radius: 25,
            color: Colors.black.withValues(alpha: 0.3),
            blur: 12,
            child: Image.asset(
              'assets/images/basic_widgets/car.webp',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            onTap: () {
              // 点击事件：弹出提示
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('按钮被点击啦！')));
            },
          ),
        ),
      ),
    );
  }
}
