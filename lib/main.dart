import 'dart:async';
import 'dart:io';

import 'package:android_play_flutter/pages/firstPage.dart';
import 'package:android_play_flutter/utils/spUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const StartPage());
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'wanAndroid',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {
  Image? imageDesc;

  @override
  void initState() {
    initConfig();
    //设置全屏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => const MyApp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "images/splash_summer.png",
      fit: BoxFit.cover,
    );
    // return Image.network('https://bak.yantuz.cn:8000/mmPic/', fit: BoxFit.cover,);
    /* return Image.network(
      'https://pics0.baidu.com/feed/6609c93d70cf3bc7f85dcbba41f12ca7cc112a7a.jpeg?token=9647514bdc7ba7ba2e239ef375a0ff2f',
      fit: BoxFit.cover,
    );*/
  }

  ///初始化配置信息
  void initConfig() {
    var spUtil = SpUtil.init();
    spUtil.then((value) => {
      initCookiePath(),
    });
  }

  void initCookiePath() {
    var appPath = setFileStoragePath();
    appPath.then((path) {
      if (SpUtil.getString("appPath") == null) {
        SpUtil.setString("appPath", path);
      }
    });
  }

  /// @Description:获取存储路径
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/16 11:46
  Future<String> setFileStoragePath() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    return appDocDirectory.path;
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    WidgetsBinding.instance.addObserver(this);
  }
}
