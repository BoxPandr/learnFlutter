```
@immutable
abstract class Widget extends DiagnosticableTree {
 static bool canUpdate(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType
        && oldWidget.key == newWidget.key;
  }

}
```
