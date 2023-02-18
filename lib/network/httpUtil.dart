import 'package:android_play_flutter/pages/beans/ArticleBean.dart';
import 'package:android_play_flutter/pages/beans/ArticleNav.dart';
import 'package:android_play_flutter/pages/beans/ArticleType.dart';
import 'package:android_play_flutter/pages/beans/BannerEntity.dart';
import 'package:android_play_flutter/pages/beans/ResponseData.dart';
import 'package:android_play_flutter/utils/spUtil.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import '../pages/beans/PersonInfo.dart';
import '../pages/beans/SubTreeBean.dart';

const String BASE_URL = "https://www.wanandroid.com/";
const String login = "user/login";
const String register = "user/register";
const String logout = "user/logout/json";
const String banner = "banner/json";
const String tree = "tree/json";
const String nav = "navi/json";
const String projectfl = "project/tree/json";
const String projectList = "project/list/PAGE/json?cid=CID";
const String tixiList = "article/list/PAGE/json?cid=CID";
const String gzh = "wxarticle/chapters/json";
const String gzhList = "wxarticle/list/CID/PAGE/json";
const String collectList = "lg/collect/list/PAGE/json";
const String articleList = "article/list/pageIndex/json";
const String collect = "lg/collect/collectId/json";
const String unCollect = "lg/uncollect_originId/collectId/json";
const String personInfo = "user/lg/userinfo/json";

class HttpConfig {
  static const baseUrl = BASE_URL;
  static const timeout = 3000;
  static const CONNECT_TIMEOUT = 5000;
  static const RECEIVE_TIMEOUT = 3000;
}

class RequestManager {
  static RequestManager? _instance;
  late Dio _dio;

  Dio get client => _dio;

  factory RequestManager() => getInstance();

  static getInstance() {
    _instance ??= RequestManager._create();
    return _instance;
  }

  RequestManager._create() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: HttpConfig.CONNECT_TIMEOUT,
        receiveTimeout: HttpConfig.RECEIVE_TIMEOUT);
    _dio = Dio(baseOptions)
      ..interceptors.add(CookieManager(
        PersistCookieJar(
            ignoreExpires: true,
            storage: FileStorage(SpUtil.getString("appPath"))),
      ))
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  void destroy() {
    _dio.close(force: true);
    _instance = null;
  }

  /// @Description: 登录
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/15 11:49
  Future<ResponseData> doLogin(String username, String password) async {
    var response = await _dio.post(login, queryParameters: {
      "username": username,
      "password": password,
    });
    if (response.statusCode != 200) {
      throw Exception("登录失败,${response.statusCode}");
    }
    return ResponseData.fromJson(response.data);
  }

  /// @Description:注册
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/15 11:50
  Future<ResponseData> doRegister(
      String username, String password, String repassword) async {
    var response = await _dio.post(register, queryParameters: {
      "username": username,
      "password": password,
      "repassword": repassword
    });
    if (response.statusCode != 200) {
      throw Exception("注册失败,${response.statusCode}");
    }
    return ResponseData.fromJson(response.data);
  }

  /// @Description: 收藏文章
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/15 17:38
  Future<ResponseData> collectArticle(int collectId) async {
    String url = collect.replaceAll("collectId", collectId.toString());
    Response response = await _dio.post(url);
    if (response.statusCode != 200) {
      throw Exception("收藏文章失败,${response.statusCode}");
    }
    return ResponseData.fromJson(response.data);
  }

  /// @Description:取消收藏
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/15 17:43
  Future<ResponseData> disCollectArticle(int collectId) async {
    String url = unCollect.replaceAll("collectId", collectId.toString());
    Response response = await _dio.post(url);
    if (response.statusCode != 200) {
      throw Exception("取消收藏失败,${response.statusCode}");
    }
    return ResponseData.fromJson(response.data);
  }

  /// @Description: 获取首页文章
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/2 12:19
  Future<ArticleBean> getHomeArticles() async {
    String url = articleList.replaceAll("pageIndex", "0");
    Response response = await _dio.get(url);
    if (response.statusCode != 200) {
      throw Exception("获取首页文章失败,${response.statusCode}");
    }
    return ArticleBean.fromJson(response.data);
  }

  /// @Description:获取首页banner
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/15 21:31
  Future<BannerEntity> getBanners() async {
    Response response = await _dio.get(banner);
    if (response.statusCode != 200) {
      throw Exception("获取首页banner失败,${response.statusCode}");
    }
    return BannerEntity.fromJson(response.data);
  }

  /// @Description:加载更多
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/15 22:44
  Future<ArticleBean> articleLoadMore(int page) async {
    String url = articleList.replaceAll("pageIndex", page.toString());
    Response response = await _dio.get(url);
    if (response.statusCode != 200) {
      throw Exception("获取首页文章失败,${response.statusCode}");
    }
    return ArticleBean.fromJson(response.data);
  }

  /// @Description:获取个人信息
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/28 16:03
  Future<PersonInfo> queryPersonInfo() async {
    Response response = await _dio.get(personInfo);
    if (response.statusCode != 200) {
      throw Exception("获取个人信息失败,${response.statusCode}");
    }
    return PersonInfo.fromJson(response.data);
  }

  /// @Description:获取知识体系
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/31 11:16
  Future<ArticleType> queryArticleTrees() async {
    Response response = await _dio.get(tree);
    if (response.statusCode != 200) {
      throw Exception("获取知识体系失败,${response.statusCode}");
    }
    return ArticleType.fromJson(response.data);
  }

  /// @Description:获取导航体系
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/31 11:16
  Future<ArticleNav> queryArticleNav() async {
    Response response = await _dio.get(nav);
    if (response.statusCode != 200) {
      throw Exception("获取知识导航失败,${response.statusCode}");
    }
    return ArticleNav.fromJson(response.data);
  }

  /// @Description:查询体系下面子信息
  /// @Author: 李丰华
  /// @CreateDate: 2023/1/31 19:50
  Future<SubTreeBean> querySubTreeArticle(int id) async{
    Response response = await _dio.get(nav);
    if (response.statusCode != 200) {
      throw Exception("获取知识子体系下分类失败,${response.statusCode}");
    }
    return SubTreeBean.fromJson(response.data);
  }


}
