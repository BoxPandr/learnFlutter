class SampleX extends StatefulWidget {
  const SampleX({Key? key}) : super(key: key);

  @override
  State<SampleX> createState() => _SampleXState();
}

class _SampleXState extends State<SampleX> {
  List<Widget> _itemList = [
    SquareBb(
      "11",
    ),
    SquareBb(
      "22",
    ),
    SquareBb(
      "33",
    ),
    SquareBb(
      "44",
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

  Color _color = Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  SquareBb(this.name, {Key? key}) : super(key: key);

  @override
  State<SquareBb> createState() => _SquareBbState();
}

class _SquareBbState extends State<SquareBb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.2,
      color: widget._color,
      child: Text(
        widget.name,
        style: TextStyle(
            fontSize: 19, color: Colors.black, backgroundColor: Colors.white),
      ),
    );
  }
}