# 学习记录

#### ios 打包文章

https://juejin.cn/post/6953144821611495431#heading-5

https://zhuanlan.zhihu.com/p/505288508

#### Overlay 图层

添加 Overlay 图层 (常用于自定义 loading，toast 等能力支持)\
Overlay.of(context)?.insert(? extends OverlayEntry);

#### !.和?.的区别

```
!.代表如果为空就抛出异常
?.代表如果为空就不执行下面操作
```

#### 问题

组件中传递 widget 过去后，传递过去的 widget 中使用的是以前的 list 集合中的 widget，需要在 build 中或者 didUpdateWidget 生命周期中删除以前的 list,更新为新的 list

```flutter
SettingBg(
    leftLine: 17.w,
    childs: [
    // 版本
    GestureDetector(
        child: Container(
        height: 44.h,
        margin: EdgeInsets.fromLTRB(16.w, 0, 22.w, 0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
                '版本',
                style: TextStyle(fontSize: 18.sp),
            ),
            Text(
                'Version $_version',
                style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xff8A8A8D),
                ),
            ),
            ],
        ),
        ),
    )
),
```
