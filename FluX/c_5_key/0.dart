
class SampleX extends StatefulWidget {
  const SampleX({Key? key}) : super(key: key);

  @override
  State<SampleX> createState() => _SampleXState();
}

class _SampleXState extends State<SampleX> {
  List<Widget> _itemList = [SquareA("11"), SquareA("22"), SquareA("33")];

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

class SquareA extends StatelessWidget {
  final String name;

  SquareA(this.name, {Key? key}) : super(key: key);

  final _color = Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: _color,
      child: Text(
        name,
        style: TextStyle(
            fontSize: 19, color: Colors.black, backgroundColor: Colors.white),
      ),
    );
  }
}
