import 'dart:async';

import 'package:android_play_flutter/network/httpUtil.dart';
import 'package:android_play_flutter/pages/beans/BannerEntity.dart';
import 'package:android_play_flutter/views/ArticleItem.dart';
import 'package:android_play_flutter/views/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'beans/ArticleBean.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  int _currentPageIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _bannerLink = [];
  final List<Widget> _bannerData = [Container()];
  final List<Widget> _articles = [Container()];
  final collectIcon = const Icon(
    Icons.favorite,
    color: Colors.red,
    size: 26,
  );

  final unCollectIcon = const Icon(
    Icons.favorite,
    color: Colors.black54,
    size: 26,
  );
  bool isCollect = false;

  @override
  void initState() {
    super.initState();
    _getBanners();
    _getHomeArticles();
    _listenToLoadMore();
  }

  /// @Description:监听并上拉刷新
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/8 17:51
  void _listenToLoadMore() {
    _scrollController.addListener(() {
      if (!_isLoading &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent) {
        setState(() {
          //加载更多
          _isLoading = true;
          _currentPageIndex++;
          _loadMore(_currentPageIndex);
        });
      }
    });
  }

  /// @Description: 获取首页banner
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/1 17:39
  void _getBanners() async {
    try {
      Future<BannerEntity> bannerEntity =
          RequestManager.getInstance().getBanners();
      bannerEntity.then((value) {
        var realData = value.data;
        _bannerData.clear();
        for (int i = 0; i < realData.length; i++) {
          _bannerData.add(Image.network(realData[i].imagePath));
          _bannerLink
              .add({"title": realData[i].title, "link": realData[i].url});
        }
        setState(() {});
      });
    } catch (e) {
      throw Exception("failed to load banners e: $e");
    }
  }

  /// @Description: 获取首页文章
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/2 12:19
  void _getHomeArticles() {
    try {
      var homeArticles =
          RequestManager.getInstance().getHomeArticles() as Future<ArticleBean>;
      homeArticles.then((articleBean) {
        var realArticleData = articleBean.data.datas;
        _articles.clear();
        _setArticleData(realArticleData);
        setState(() {});
        //如果是第一次加载，将Banner放置集合首位
        _articles.insert(
            0,
            SizedBox(
                height: 200.0,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return _bannerData[index];
                  },
                  itemCount: _bannerData.length,
                  pagination: const SwiperPagination(),
                  autoplay: true,
                  autoplayDelay: 3000,
                  onTap: (position) {
                    Navigator.pushNamed(context, "/article", arguments: {
                      "title": _bannerLink[position]['title'],
                      "link": _bannerLink[position]['link'],
                    });
                  },
                )));
      });
    } catch (e) {
      throw Exception("failed to load HomeArticles $e");
    }
  }

  /// @Description: 设置文章数据
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/2 14:43
  void _setArticleData(List<DatasBean> realArticleDatas) {
    for (int i = 0; i < realArticleDatas.length; i++) {
      String realName = "";
      var title = realArticleDatas[i].title;
      var link = realArticleDatas[i].link;
      var niceShareDate = realArticleDatas[i].niceShareDate;
      var chapterName = realArticleDatas[i].chapterName;
      var id = realArticleDatas[i].id;
      var collect = realArticleDatas[i].collect;
      if (realArticleDatas[i].author.isEmpty) {
        realName = realArticleDatas[i].shareUser;
      } else {
        realName = realArticleDatas[i].author;
      }
      if (!realArticleDatas[i].collect) {
        setState(() {
          isCollect = false;
        });
      } else {
        setState(() {
          isCollect = true;
        });
      }
      _articles.add(ArticleItem(
        title: title,
        link: link,
        niceShareDate: niceShareDate,
        realName: realName,
        chapterName: chapterName,
        id: id,
        collect: collect,
      ));
      setState(() {});
    }
  }

  /// @Description: 加载更多
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/5 16:10
  void _loadMore(int articleIndex) async {
    try {
      var articleLoadMore = RequestManager.getInstance()
          .articleLoadMore(articleIndex) as Future<ArticleBean>;
      Future.delayed(const Duration(milliseconds: 10), () {
        articleLoadMore.then((value) {
          setState(() {
            _isLoading = false;
            var realArticleData = value.data.datas;
            if (realArticleData.isNotEmpty) {
              _setArticleData(realArticleData);
              setState(() {});
            }
          });
        });
      });
    } catch (e) {
      throw Exception("加载更多失败 $e");
    }
  }

  /// @Description:首页刷新
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/8 17:50
  Future<void> _refreshBannerAndData() async {
    runZonedGuarded(
        () async => {
              _getBanners(),
              _getHomeArticles(),
              setState(() {
                _currentPageIndex = 0;
                ToastUtil.showToast(message: "更新成功");
              }),
            }, (e, s) {
      s.toString();
      ToastUtil.showToast(message: "刷新失败:$e");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black54,
              ),
              onPressed: () {
                //搜索点击事件
                Navigator.pushNamed(context, "/login");
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Colors.white,
          title: const Text(
            '首页',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: _refreshBannerAndData,
            child: ListView.separated(
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                if (index == _articles.length - 1) {
                  return SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '加载更多...',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF111111),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 15)),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 3),
                          ),
                        ],
                      ));
                } else {
                  return Center(
                    child: _articles.toList()[index],
                  );
                }
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 0);
              },
              itemCount: _articles.length,
            )));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    RequestManager.getInstance().destroy();
  }
}
