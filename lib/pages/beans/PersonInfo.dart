//******************************************************************
//**************************** Generate By JsonToDartBean  **********
//**************************** Sat Jan 28 16:00:44 CST 2023  **********
//******************************************************************

import 'package:json_holder_impl/json_holder_impl.dart';

class PersonInfo with JsonHolderImpl<PersonInfo> {
  /// [key : value] => [data : null]
  DataBean get data => getValue("data");
  set data(DataBean value) => setValue("data", value);

  /// [key : value] => [errorCode : 0]
  int get errorCode => getValue("errorCode");
  set errorCode(int value) => setValue("errorCode", value);

  /// [key : value] => [errorMsg : ]
  String get errorMsg => getValue("errorMsg");
  set errorMsg(String value) => setValue("errorMsg", value);

  PersonInfo.fromJson([Map<String, dynamic> ?json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<PersonInfo> provideCreator(Map<String, dynamic> json) {
    return PersonInfo.fromJson(json);
  }

  @override
  List<PersonInfo> provideListCreator() {
    return <PersonInfo>[];
  }

  @override
  List<List<PersonInfo>> provideListListCreator() {
    return <List<PersonInfo>>[];
  }

}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [coinInfo : null]
  CoinInfoBean get coinInfo => getValue("coinInfo");
  set coinInfo(CoinInfoBean value) => setValue("coinInfo", value);

  /// [key : value] => [collectArticleInfo : null]
  CollectArticleInfoBean get collectArticleInfo => getValue("collectArticleInfo");
  set collectArticleInfo(CollectArticleInfoBean value) => setValue("collectArticleInfo", value);

  /// [key : value] => [userInfo : null]
  UserInfoBean get userInfo => getValue("userInfo");
  set userInfo(UserInfoBean value) => setValue("userInfo", value);

  DataBean.fromJson([Map<String, dynamic> ?json]) {
    fromJson(json);
    CoinInfoBean.fromJson();
    CollectArticleInfoBean.fromJson();
    UserInfoBean.fromJson();
  }

  @override
  JsonHolderImpl<DataBean> provideCreator(Map<String, dynamic> json) {
    return DataBean.fromJson(json);
  }

  @override
  List<DataBean> provideListCreator() {
    return <DataBean>[];
  }

  @override
  List<List<DataBean>> provideListListCreator() {
    return <List<DataBean>>[];
  }

}

class CoinInfoBean with JsonHolderImpl<CoinInfoBean> {
  /// [key : value] => [coinCount : 2470]
  int get coinCount => getValue("coinCount");
  set coinCount(int value) => setValue("coinCount", value);

  /// [key : value] => [level : 25]
  int get level => getValue("level");
  set level(int value) => setValue("level", value);

  /// [key : value] => [nickname : ]
  String get nickname => getValue("nickname");
  set nickname(String value) => setValue("nickname", value);

  /// [key : value] => [rank : 1090]
  String get rank => getValue("rank");
  set rank(String value) => setValue("rank", value);

  /// [key : value] => [userId : 76328]
  int get userId => getValue("userId");
  set userId(int value) => setValue("userId", value);

  /// [key : value] => [username : 1**53461844]
  String get username => getValue("username");
  set username(String value) => setValue("username", value);

  CoinInfoBean.fromJson([Map<String, dynamic> ?json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<CoinInfoBean> provideCreator(Map<String, dynamic> json) {
    return CoinInfoBean.fromJson(json);
  }

  @override
  List<CoinInfoBean> provideListCreator() {
    return <CoinInfoBean>[];
  }

  @override
  List<List<CoinInfoBean>> provideListListCreator() {
    return <List<CoinInfoBean>>[];
  }

}

class CollectArticleInfoBean with JsonHolderImpl<CollectArticleInfoBean> {
  /// [key : value] => [count : 133]
  int get count => getValue("count");
  set count(int value) => setValue("count", value);

  CollectArticleInfoBean.fromJson([Map<String, dynamic> ?json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<CollectArticleInfoBean> provideCreator(Map<String, dynamic> json) {
    return CollectArticleInfoBean.fromJson(json);
  }

  @override
  List<CollectArticleInfoBean> provideListCreator() {
    return <CollectArticleInfoBean>[];
  }

  @override
  List<List<CollectArticleInfoBean>> provideListListCreator() {
    return <List<CollectArticleInfoBean>>[];
  }

}

class UserInfoBean with JsonHolderImpl<UserInfoBean> {
  /// [key : value] => [admin : false]
  bool get admin => getValue("admin");
  set admin(bool value) => setValue("admin", value);

  /// [key : value] => [coinCount : 2470]
  int get coinCount => getValue("coinCount");
  set coinCount(int value) => setValue("coinCount", value);

  /// [key : value] => [email : 739574055@qq.com]
  String get email => getValue("email");
  set email(String value) => setValue("email", value);

  /// [key : value] => [icon : ]
  String get icon => getValue("icon");
  set icon(String value) => setValue("icon", value);

  /// [key : value] => [id : 76328]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [nickname : LFHQAQ]
  String get nickname => getValue("nickname");
  set nickname(String value) => setValue("nickname", value);

  /// [key : value] => [password : ]
  String get password => getValue("password");
  set password(String value) => setValue("password", value);

  /// [key : value] => [publicName : LFHQAQ]
  String get publicName => getValue("publicName");
  set publicName(String value) => setValue("publicName", value);

  /// [key : value] => [token : ]
  String get token => getValue("token");
  set token(String value) => setValue("token", value);

  /// [key : value] => [type : 0]
  int get type => getValue("type");
  set type(int value) => setValue("type", value);

  /// [key : value] => [username : 17853461844]
  String get username => getValue("username");
  set username(String value) => setValue("username", value);

  /// [key : value] => [chapterTops : null]
  List get chapterTops => getValue("chapterTops");
  set chapterTops(List value) => setValue("chapterTops", value);

  /// [key : value] => [collectIds : null]
  List<int> get collectIds => getValue("collectIds");
  set collectIds(List<int> value) => setValue("collectIds", value);

  UserInfoBean.fromJson([Map<String, dynamic> ?json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<UserInfoBean> provideCreator(Map<String, dynamic> json) {
    return UserInfoBean.fromJson(json);
  }

  @override
  List<UserInfoBean> provideListCreator() {
    return <UserInfoBean>[];
  }

  @override
  List<List<UserInfoBean>> provideListListCreator() {
    return <List<UserInfoBean>>[];
  }

}

