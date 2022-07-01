
class SampleX extends StatefulWidget {
  const SampleX({Key? key}) : super(key: key);

  @override
  State<SampleX> createState() => _SampleXState();
}

class _SampleXState extends State<SampleX> {
  List<Widget> _itemList = [
    SquareBb(
      "11",
      key: ValueKey("haha"),
    ),
    SquareBb(
      "22",
      key: ValueKey(111),
    ),
    SquareBb(
      "33",
      key: ValueKey(666),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _itemList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _itemList.removeAt(0);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SquareBb extends StatefulWidget {
  final String name;

  const SquareBb(this.name, {Key? key}) : super(key: key);

  @override
  State<SquareBb> createState() => _SquareBbState();
}

class _SquareBbState extends State<SquareBb> {
  final _color = Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: _color,
      child: Text(
        widget.name,
        style: TextStyle(
            fontSize: 19, color: Colors.black, backgroundColor: Colors.white),
      ),
    );
  }
}
