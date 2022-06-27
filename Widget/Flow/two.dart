  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; ++i) {
      final offsetCross =
          context.getChildSize(i)!.width * menuAnimation.value * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          offsetCross,
          offsetCross,
          0,
        ),
      );
    }
  }