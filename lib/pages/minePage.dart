import 'dart:async';
import 'dart:convert';

import 'package:android_play_flutter/events/eventBus.dart';
import 'package:android_play_flutter/events/logInEvents.dart';
import 'package:android_play_flutter/events/pageChangedEvent.dart';
import 'package:android_play_flutter/network/httpUtil.dart';
import 'package:android_play_flutter/pages/beans/PersonInfo.dart';
import 'package:android_play_flutter/utils/spUtil.dart';
import 'package:android_play_flutter/views/toast.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  bool isNightMode = false;
  bool isLoadBaseInfo = false;
  var rankNum = ' — ';
  var userId = ' — ';
  var nikeName = "点击登录";
  var collectNum = ' — ';
  var userLevel = '—';
  var coinNum = '—';
  late StreamSubscription _listen;
  late final StreamSubscription _pageChangedListen;
  final bool? _inLogged = SpUtil.getBool("isInLogin");

  Widget _switchTheme() {
    if (!isNightMode) {
      return const Icon(
        Icons.nightlight_outlined,
        color: Colors.black54,
      );
    }
    return const Icon(
      Icons.sunny,
      color: Colors.black54,
    );
  }

  @override
  void initState() {
    super.initState();
    _setUserInfoWhenLogSuccess();
    _setUseInfoFromLocalData();
    ///切换到个人界面时，更新个人信息
    onPageChanged();
  }

  /// @Description:应用切换到此界面
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/29 10:28
  void onPageChanged() {
    _pageChangedListen = eventBus.on<PageChangedEvent>().listen((event) {
      if (_inLogged!) {
        ///获取用户信息
        Future<PersonInfo> personInfo =
            RequestManager.getInstance().queryPersonInfo();
        personInfo.then((value) {
          var thisData = value.data;

          ///标记是否需要更新本地数据
          bool needToUpdateInfo = false;

          ///进行信息比对,更新成最新的信息
          if (rankNum != thisData.coinInfo.rank) {
            setState(() {
              rankNum == thisData.coinInfo.rank;
            });
            needToUpdateInfo = true;
          }

          if (nikeName != thisData.userInfo.nickname) {
            setState(() {
              nikeName = thisData.userInfo.nickname;
            });
            needToUpdateInfo = true;
          }

          if (collectNum != thisData.collectArticleInfo.count.toString()) {
            setState(() {
              collectNum = thisData.collectArticleInfo.count.toString();
            });
            needToUpdateInfo = true;
          }

          if (userLevel != thisData.coinInfo.level.toString()) {
            setState(() {
              userLevel = thisData.coinInfo.level.toString();
            });
            needToUpdateInfo = true;
          }

          if (coinNum != thisData.coinInfo.coinCount.toString()) {
            setState(() {
              coinNum = thisData.coinInfo.coinCount.toString();
            });
            needToUpdateInfo = true;
          }
          if (needToUpdateInfo) {
            SpUtil.removeString("userInfo");
            String userInfoStr = jsonEncode(value);
            SpUtil.setString("userInfo", userInfoStr);
          }
        });
      } else {
        rankNum = ' — ';
        userId = ' — ';
        nikeName = "点击登录";
        collectNum = ' — ';
        userLevel = '—';
        coinNum = '—';
      }
    });
  }

  /// @Description:设置本地数据
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/29 14:07
  void _setUseInfoFromLocalData() {
    if (SpUtil.getString("userInfo") == null) {
      return;
    }
    String str = SpUtil.getString("userInfo")!;
    if (str.isNotEmpty) {
      var personInfo2 = PersonInfo.fromJson(jsonDecode(str));
      _setInfo(personInfo2);
    }
  }

  /// @Description:设置个人信息，当登陆成功时
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/28 18:04
  void _setUserInfoWhenLogSuccess() {
    _listen = eventBus.on<UserInfoBeanLoggedInEvent>().listen((event) {
      setState(() {
        _setInfo(event.user);
      });
    });
  }

  void _setInfo(PersonInfo personInfo) {
    var data = personInfo.data;
    rankNum = data.coinInfo.rank;
    userId = data.coinInfo.userId.toString();
    nikeName = data.userInfo.nickname;
    collectNum = data.collectArticleInfo.count.toString();
    userLevel = data.coinInfo.level.toString();
    coinNum = data.coinInfo.coinCount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: const Icon(
                Icons.qr_code_scanner,
                color: Colors.black54,
              )),
          IconButton(
              onPressed: () {
                //换肤
              },
              icon: const Icon(
                Icons.color_lens_outlined,
                color: Colors.black54,
              )),
          IconButton(
              onPressed: () {
                //夜间模式
              },
              icon: _switchTheme())
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          IntrinsicHeight(
              child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: ClipOval(
                  child: Image.network(
                    "https://img0.baidu.com/it/u=1396456140,563000347&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=633",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (!_inLogged!) {
                                Navigator.pushNamed(context, "/login");
                              }
                            },
                            child: Text(nikeName,
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.black87),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Image.asset('images/ic_level.png',
                                width: 20, height: 20),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 2),
                            child: Text(
                              userLevel,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        "images/ic_vip_common.png",
                        width: 22,
                        height: 22,
                      ),
                      Text(
                        '硬币 : $coinNum',
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black54),
                      )
                    ],
                  )),
            ],
          )),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      rankNum,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      '排名',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    )
                  ],
                ),
                Image.asset(
                  "images/ic_devide_vertical.png",
                  width: 22,
                  height: 25,
                ),
                Column(
                  children: [
                    Text(
                      userId,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'UID',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    )
                  ],
                ),
                Image.asset(
                  "images/ic_devide_vertical.png",
                  width: 22,
                ),
                Column(
                  children: [
                    Text(
                      collectNum,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      '收藏',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _listen.cancel();
    _pageChangedListen.cancel();
  }
}
