import 'package:android_play_flutter/network/httpUtil.dart';
import 'package:android_play_flutter/views/Loading.dart';
import 'package:android_play_flutter/views/toast.dart';
import 'package:flutter/material.dart';
import '../beans/ResponseData.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _LoginState();
}

class _LoginState extends State<RegisterPage> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _rePasswordTextController =
      TextEditingController();
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
                            color: Colors.blue,
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
                      child: TextField(
                        obscureText: true,
                        autofocus: false,
                        controller: _rePasswordTextController,
                        decoration: const InputDecoration(
                            labelText: "再次输入密码",
                            hintText: "请输入密码",
                            prefixIcon: Icon(Icons.password_sharp)),
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
                          Future<ResponseData> doRegister =
                              RequestManager.getInstance().doRegister(
                                  _usernameTextController.text,
                                  _passwordTextController.text,
                                  _rePasswordTextController.text);
                          doRegister.then((value) => {
                            ToastUtil.showToast(message: value.errorMsg),
                          });
                        },
                        child: const Text(
                          '注册',
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
    );
  }
}
