
//******************************************************************
//**************************** Generate By JsonToDartBean  **********
//**************************** Tue Jan 31 15:47:39 CST 2023  **********
//******************************************************************

import 'package:json_holder_impl/json_holder_impl.dart';

class ArticleNav with JsonHolderImpl<ArticleNav> {
  /// [key : value] => [errorCode : 0]
  int get errorCode => getValue("errorCode");
  set errorCode(int value) => setValue("errorCode", value);

  /// [key : value] => [errorMsg : ]
  String get errorMsg => getValue("errorMsg");
  set errorMsg(String value) => setValue("errorMsg", value);

  /// [key : value] => [data : null]
  List<DataBean> get data => getValue("data");
  set data(List<DataBean> value) => setValue("data", value);

  ArticleNav.fromJson([Map<String, dynamic> ?json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<ArticleNav> provideCreator(Map<String, dynamic> json) {
    return ArticleNav.fromJson(json);
  }

  @override
  List<ArticleNav> provideListCreator() {
    return <ArticleNav>[];
  }

  @override
  List<List<ArticleNav>> provideListListCreator() {
    return <List<ArticleNav>>[];
  }

}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [cid : 272]
  int get cid => getValue("cid");
  set cid(int value) => setValue("cid", value);

  /// [key : value] => [name : 常用网站]
  String get name => getValue("name");
  set name(String value) => setValue("name", value);

  /// [key : value] => [articles : null]
  List<ArticlesBean> get articles => getValue("articles");
  set articles(List<ArticlesBean> value) => setValue("articles", value);

  DataBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    ArticlesBean.fromJson();
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

class ArticlesBean with JsonHolderImpl<ArticlesBean> {
  /// [key : value] => [adminAdd : false]
  bool get adminAdd => getValue("adminAdd");
  set adminAdd(bool value) => setValue("adminAdd", value);

  /// [key : value] => [apkLink : ]
  String get apkLink => getValue("apkLink");
  set apkLink(String value) => setValue("apkLink", value);

  /// [key : value] => [audit : 1]
  int get audit => getValue("audit");
  set audit(int value) => setValue("audit", value);

  /// [key : value] => [author : 小编]
  String get author => getValue("author");
  set author(String value) => setValue("author", value);

  /// [key : value] => [canEdit : false]
  bool get canEdit => getValue("canEdit");
  set canEdit(bool value) => setValue("canEdit", value);

  /// [key : value] => [chapterId : 272]
  int get chapterId => getValue("chapterId");
  set chapterId(int value) => setValue("chapterId", value);

  /// [key : value] => [chapterName : 常用网站]
  String get chapterName => getValue("chapterName");
  set chapterName(String value) => setValue("chapterName", value);

  /// [key : value] => [collect : false]
  bool get collect => getValue("collect");
  set collect(bool value) => setValue("collect", value);

  /// [key : value] => [courseId : 13]
  int get courseId => getValue("courseId");
  set courseId(int value) => setValue("courseId", value);

  /// [key : value] => [desc : ]
  String get desc => getValue("desc");
  set desc(String value) => setValue("desc", value);

  /// [key : value] => [descMd : ]
  String get descMd => getValue("descMd");
  set descMd(String value) => setValue("descMd", value);

  /// [key : value] => [envelopePic : ]
  String get envelopePic => getValue("envelopePic");
  set envelopePic(String value) => setValue("envelopePic", value);

  /// [key : value] => [fresh : false]
  bool get fresh => getValue("fresh");
  set fresh(bool value) => setValue("fresh", value);

  /// [key : value] => [host : ]
  String get host => getValue("host");
  set host(String value) => setValue("host", value);

  /// [key : value] => [id : 1848]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [isAdminAdd : false]
  bool get isAdminAdd => getValue("isAdminAdd");
  set isAdminAdd(bool value) => setValue("isAdminAdd", value);

  /// [key : value] => [link : https://developers.google.cn/]
  String get link => getValue("link");
  set link(String value) => setValue("link", value);

  /// [key : value] => [niceDate : 2018-01-07 18:59]
  String get niceDate => getValue("niceDate");
  set niceDate(String value) => setValue("niceDate", value);

  /// [key : value] => [niceShareDate : 未知时间]
  String get niceShareDate => getValue("niceShareDate");
  set niceShareDate(String value) => setValue("niceShareDate", value);

  /// [key : value] => [origin : ]
  String get origin => getValue("origin");
  set origin(String value) => setValue("origin", value);

  /// [key : value] => [prefix : ]
  String get prefix => getValue("prefix");
  set prefix(String value) => setValue("prefix", value);

  /// [key : value] => [projectLink : ]
  String get projectLink => getValue("projectLink");
  set projectLink(String value) => setValue("projectLink", value);

  /// [key : value] => [publishTime : 1515322795000]
  int get publishTime => getValue("publishTime");
  set publishTime(int value) => setValue("publishTime", value);

  /// [key : value] => [realSuperChapterId : 0]
  int get realSuperChapterId => getValue("realSuperChapterId");
  set realSuperChapterId(int value) => setValue("realSuperChapterId", value);

  /// [key : value] => [selfVisible : 0]
  int get selfVisible => getValue("selfVisible");
  set selfVisible(int value) => setValue("selfVisible", value);

  /// [key : value] => [shareDate : null]
  Object get shareDate => getValue("shareDate");
  set shareDate(Object value) => setValue("shareDate", value);

  /// [key : value] => [shareUser : ]
  String get shareUser => getValue("shareUser");
  set shareUser(String value) => setValue("shareUser", value);

  /// [key : value] => [superChapterId : 0]
  int get superChapterId => getValue("superChapterId");
  set superChapterId(int value) => setValue("superChapterId", value);

  /// [key : value] => [superChapterName : ]
  String get superChapterName => getValue("superChapterName");
  set superChapterName(String value) => setValue("superChapterName", value);

  /// [key : value] => [title : Google开发者]
  String get title => getValue("title");
  set title(String value) => setValue("title", value);

  /// [key : value] => [type : 0]
  int get type => getValue("type");
  set type(int value) => setValue("type", value);

  /// [key : value] => [userId : -1]
  int get userId => getValue("userId");
  set userId(int value) => setValue("userId", value);

  /// [key : value] => [visible : 0]
  int get visible => getValue("visible");
  set visible(int value) => setValue("visible", value);

  /// [key : value] => [zan : 0]
  int get zan => getValue("zan");
  set zan(int value) => setValue("zan", value);

  /// [key : value] => [tags : null]
  List get tags => getValue("tags");
  set tags(List value) => setValue("tags", value);

  ArticlesBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<ArticlesBean> provideCreator(Map<String, dynamic> json) {
    return ArticlesBean.fromJson(json);
  }

  @override
  List<ArticlesBean> provideListCreator() {
    return <ArticlesBean>[];
  }

  @override
  List<List<ArticlesBean>> provideListListCreator() {
    return <List<ArticlesBean>>[];
  }

}

