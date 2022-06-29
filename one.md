文件的别名，
作为命名控件，

防止不同文件/包/库，的方法名称冲突 / 雷同

import 'package:http/http.dart' as http;

<hr>

pubspec 的依赖插件的版本管理：

```
dio: ^4.0.6 // 大版本不变的区间写法， " v >= 4.0.6 && v < 5.0.0"
```

<hr>

`native_imp.dart`文件里面的，

```
export 'src/entry/dio_for_native.dart' show DioForNative;
```

show 是仅暴露的意思？

<hr>

#### `MixIn` 混入,

就像类的扩展，

多继承的一种方式。

<hr>

使用 `with` 来混入，

一个或多个，MixIn

<hr>
