
class SampleX extends StatelessWidget {
  final GlobalKey<_XxxxxState> _zoneK = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Xxxxx(
        key: _zoneK,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _XxxxxState? status = _zoneK.currentState;
          if (status != null) {
            status.setState(() {
              status.widget._itemList.removeAt(0);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Xxxxx extends StatefulWidget {
  List<Widget> _itemList = [
    SquareBb(
      "11",
      key: ValueKey(11),
    ),
    SquareBb(
      "22",
      key: ValueKey(22),
    ),
    SquareBb(
      "33",
      key: ValueKey(33),
    ),
    SquareBb(
      "44",
      key: ValueKey(44),
    )
  ];
  Xxxxx({Key? key}) : super(key: key);

  @override
  State<Xxxxx> createState() => _XxxxxState();
}

class _XxxxxState extends State<Xxxxx> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget._itemList,
      ),
    );
  }
}

class SquareBb extends StatefulWidget {
  final String name;

  SquareBb(this.name, {Key? key}) : super(key: key);

  @override
  State<SquareBb> createState() => _SquareBbState();
}

class _SquareBbState extends State<SquareBb> {
  Color _color = Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.2,
      color: _color,
      child: Text(
        widget.name,
        style: TextStyle(
            fontSize: 19, color: Colors.black, backgroundColor: Colors.white),
      ),
    );
  }
}
