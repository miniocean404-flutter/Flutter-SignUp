https://pub.dev/packages/path_provider

1. getTemporaryDirectory()：获取临时文件夹，针对于 Android 设备 getCacheDir() 和 iOS 设备 NSTemporaryDirectory() 返回的值 (不会备份并且随时会被删除的临时目录)
2. getApplicationDocumentsDirectory()：获取 Document 文件夹，针对 Android 设备的 AppDate 目录，iOS 设备的 NSDocumentDirectory 目录 (用于放置用户生成的数据或不能有应用程序重新创建的数据 用户不可见)
3. getApplicationSupportDirectory：获取应用支持目录 (用于存储应用支持的目录 这个目录对于用户是不可见的)
4. getLibraryDirectory：获取应用持久存储目录路径，只有 iOS 设备可用 (应用程序可以存储持久化、备份和用户不可见的文件的目录路径)
5. getExternalStorageDirectory()： 获取存储卡目录，只有 Android 设备可用 (获取外部存储目录 用户可见)
6. getExternalStorageDirectories（type: type）：获取外部存储目录列表，只有 Android 设备可用 (可以存储应用程序特定数据的目录,这些路径通常驻留在外部存储上 用户可见 如单独的分区或 SD 卡(可以有多个 所以是列表))
7. getExternalCacheDirectories()：获取外部缓存目录，只有 Android 设备可用 (可以存储应用程序特定外部存储数据的目录,这些路径通常驻留在外部存储上，如单独的分区或 SD 卡(可以有多个 所以是列表))
8. getDownloadsDirectory()： 获取下载目录(仅桌面可用 安卓和 IOS 报错)

Supported platforms and paths
Directories support by platform:

```dart
// 这三个目录是所有平台支持（除 web ）
getGeneralDir() {
  // 系统可随时清除的临时目录（缓存）
  getTemporaryDirectory();
  // 应用程序的文档目录，该目录用于存储只有自己可以访问的文件。只有当应用程序被卸载时，系统才会清除该目录
  // 在 iOS 上，这对应于NSDocumentDirectory。在 Android 上，这是AppData目录
  getApplicationDocumentsDirectory();
  getApplicationSupportDirectory();
}
```
