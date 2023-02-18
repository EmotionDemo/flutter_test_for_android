import 'package:android_play_flutter/network/httpUtil.dart';
import 'package:android_play_flutter/pages/beans/ArticleNav.dart';
import 'package:android_play_flutter/pages/beans/ArticleType.dart';
import 'package:android_play_flutter/views/GroundItem.dart';
import 'package:android_play_flutter/views/GroundNavItem.dart';
import 'package:android_play_flutter/views/toast.dart';
import 'package:flutter/material.dart';

class GroundPage extends StatefulWidget {
  const GroundPage({Key? key}) : super(key: key);

  @override
  State<GroundPage> createState() => _GroundPageState();
}

class _GroundPageState extends State<GroundPage>
    with SingleTickerProviderStateMixin {
  var imageKey = 0;
  late TabController _tabController;
  List<Widget> trees = [];
  List<Widget> nav = [];
  final List<Tab> tabs = const [
    Tab(text: '体系'),
    Tab(text: '导航'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    trees = _getTreeList();
    nav = _getNavList();
  }

  ///获取体系知识树
  List<Widget> _getTreeList() {
    List<Widget> trees = [];
    try {
      Future<ArticleType> queryArticleTrees =
          RequestManager.getInstance().queryArticleTrees();
      queryArticleTrees.then((value) {
        var listData = value.data;
        setState(() {
          for (int i = 0; i < listData.length; i++) {
            trees.add(ClassifyTypeWidget(dataBean: listData[i]));
          }
        });
      });
    } catch (e) {
      ToastUtil.showToast(message: "出现异常:$e");
    }
    return trees;
  }

  ///获取导航信息
  List<Widget> _getNavList() {
    List<Widget> nav = [];
    try {
      Future<ArticleNav> queryArticleNav = RequestManager.getInstance().queryArticleNav();
      queryArticleNav.then((value) {
        var listData = value.data;
        print('aaaaa---->$listData');
        setState(() {
          for (int i = 0; i < listData.length; i++) {
            nav.add(ClassifyNavTypeWidget(dataBean: listData[i]));
          }
        });
      });
    } catch (e) {
      ToastUtil.showToast(message: "请求导航信息出现异常:$e");
    }
    return nav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          height: 40,
          child: TabBar(
            controller: _tabController,
            isScrollable: false,
            labelColor: Colors.blue,
            labelStyle: const TextStyle(color: Colors.blue, fontSize: 22),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.blue,
            unselectedLabelStyle:
                const TextStyle(color: Colors.black54, fontSize: 19),
            unselectedLabelColor: Colors.black54,
            tabs: tabs,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return trees.toList()[index];
            },
            itemCount: trees.length,
            shrinkWrap: true,
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return nav.toList()[index];
            },
            itemCount: nav.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
