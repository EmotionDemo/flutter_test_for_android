import 'dart:convert';

import 'package:android_play_flutter/events/eventBus.dart';
import 'package:android_play_flutter/events/logInEvents.dart';
import 'package:android_play_flutter/network/httpUtil.dart';
import 'package:android_play_flutter/pages/beans/PersonInfo.dart';
import 'package:android_play_flutter/pages/beans/ResponseData.dart';
import 'package:android_play_flutter/utils/spUtil.dart';
import 'package:android_play_flutter/views/Loading.dart';
import 'package:android_play_flutter/views/toast.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
          debugShowCheckedModeBanner: false,
          //SingleChildScrollView
          home: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 20),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_circle_left_outlined,
                            color: Colors.black54,
                            size: 32,
                          )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Image.network(
                      "https://www.wanandroid.com/resources/image/pc/logo.png",
                      width: 110,
                      height: 110,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        autofocus: false,
                        controller: _usernameTextController,
                        decoration: const InputDecoration(
                            labelText: "用户名",
                            hintText: "用户名或邮箱",
                            prefixIcon: Icon(Icons.person)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        obscureText: true,
                        autofocus: false,
                        controller: _passwordTextController,
                        decoration: const InputDecoration(
                            labelText: "请输入密码",
                            hintText: "请输入密码",
                            prefixIcon: Icon(Icons.password)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 300,
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          Future<ResponseData> response =
                              RequestManager.getInstance().doLogin(
                            _usernameTextController.text,
                            _passwordTextController.text,
                          );
                          response.then((userInfo) {
                            setState(() {
                              //结束等待
                              _isLoading = false;
                            });
                            if (userInfo.errorCode == 0) {
                              SpUtil.setBool("isInLogin", true);

                              ///获取用户信息
                              Future<PersonInfo> personInfo =
                                  RequestManager.getInstance()
                                      .queryPersonInfo();
                              personInfo.then((value) {
                                ///把事件发送到个人页
                                eventBus.fire(UserInfoBeanLoggedInEvent(value));

                                ///存储个人信息到本地
                                SpUtil.removeString("userInfo");
                                String userInfoStr = jsonEncode(value);
                                SpUtil.setString("userInfo", userInfoStr);
                              });
                              Navigator.pop(context);
                            } else {
                              SpUtil.removeString("userInfo");
                            }
                            ToastUtil.showToast(message: userInfo.errorMsg);
                          });
                        },
                        child: const Text(
                          '登录',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Offstage(
                offstage: !_isLoading,
                child: Loading(),
              )
            ],
          )),
      resizeToAvoidBottomInset: false,
    );
  }
}
