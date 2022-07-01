// Widget 不存在于渲染树中，就会被销毁

// 尽管数据持有 ( 数据在内存中 )，widget 不处于渲染树中，widget 相当于被释放了

// Flutter 的渲染逻辑，内存里面的 widget，上界面，就得重新渲染。

// Flutter， 高性能的渲染： 一般，不显示在界面上的 Widget, 会被释放，不会被保留

// Flutter 是，单页面的应用

<hr>

<hr>

<hr>

增量渲染，

重新绘制 diff,

新的 widget 和旧的 Widget 不同的部分

<hr>

旧的 Widget，从 element 里面获取
