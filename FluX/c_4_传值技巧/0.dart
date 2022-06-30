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

class One extends StatefulWidget {
  const One({Key? key}) : super(key: key);

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Two(cnt)
      ],
    );
  }
}

class Two extends StatelessWidget {
  final int cnt;

  const Two(this.cnt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Three(cnt);
  }
}

class Three extends StatelessWidget {
  final int cnt;
  const Three(this.cnt, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Four(cnt);
  }
}

class Four extends StatefulWidget {
  final int cnt;

  const Four(this.cnt, {Key? key}) : super(key: key);

  @override
  State<Four> createState() => _FourState();
}

class _FourState extends State<Four> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.cnt.toString(),
      style: TextStyle(fontSize: 30, color: Colors.red),
    );
  }
}
