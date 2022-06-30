import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Scaffold(
        body: One(),
      ),
    );
  }
}

// 解决，数据共享

// 一个 widget A 持有 InheritedWidget 类的成员，

// 该 widget A 的所有子 widget , 都可以拿到 InheritedWidget 成员的数据

// 类似， provider

class SharedData extends InheritedWidget {
  // 把需要共享的数据，在这里定义

  final int count; // 需要在子 Widget 中，获取

  SharedData(this.count, Widget child) : super(child: child);

  // 返回自身
  // 通过类方法，让子 Widget 访问共享数据
  static SharedData? of(BuildContext ctx) {
    return ctx.dependOnInheritedWidgetOfExactType<SharedData>();
  }

  // 当数据 data ( count  ), 发生变化的时候，
// 是否要通知，相关的 Widget ( 依赖这个数据 data ( count  ) 的 Widget )

  @override
  bool updateShouldNotify(covariant SharedData oldWidget) {
    // 如果返回 true, 就会调用依赖该数据的 Widget 的 Builder 方法
    return count != oldWidget.count;
  }
}

class One extends StatefulWidget {
  const One({Key? key}) : super(key: key);

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return SharedData(
        cnt,
        Column(
          children: [
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  print("老杂种");
                  cnt += 1;
                });
              },
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
            Two()
          ],
        ));
  }
}

class Two extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Three();
  }
}

class Three extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Four();
  }
}

class Four extends StatefulWidget {
  @override
  State<Four> createState() => _FourState();
}

class _FourState extends State<Four> {
  @override
  Widget build(BuildContext context) {
    int val = 0;
    final SharedData? shared = SharedData.of(context);
    if (shared != null) {
      val = shared.count;
    }

    return Text(
      val.toString(),
      style: TextStyle(fontSize: 30, color: Colors.red),
    );
  }

  // 依赖的 InheritedWidget， 发生变化后，
  // 也会调用 didChangeDependencies
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
