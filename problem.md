1.组件中传递 widget 过去后，传递过去的 widget 中监听事件并 setState 失效：需要使用状态管理进行数据的更新

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
