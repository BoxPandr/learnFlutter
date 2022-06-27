```
class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {



  @override
  void dispose() {
    menuAnimation.dispose();
    super.dispose();
  }
}
```
