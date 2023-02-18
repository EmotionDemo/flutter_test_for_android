
//******************************************************************
//**************************** Generate By JsonToDartBean  **********
//**************************** Tue Jan 31 19:48:25 CST 2023  **********
//******************************************************************

import 'package:json_holder_impl/json_holder_impl.dart';

class SubTreeBean with JsonHolderImpl<SubTreeBean> {
  /// [key : value] => [data : null]
  DataBean get data => getValue("data");
  set data(DataBean value) => setValue("data", value);

  /// [key : value] => [errorCode : 0]
  int get errorCode => getValue("errorCode");
  set errorCode(int value) => setValue("errorCode", value);

  /// [key : value] => [errorMsg : ]
  String get errorMsg => getValue("errorMsg");
  set errorMsg(String value) => setValue("errorMsg", value);

  SubTreeBean.fromJson([Map<String, dynamic> ?json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<SubTreeBean> provideCreator(Map<String, dynamic> json) {
    return SubTreeBean.fromJson(json);
  }

  @override
  List<SubTreeBean> provideListCreator() {
    return <SubTreeBean>[];
  }

  @override
  List<List<SubTreeBean>> provideListListCreator() {
    return <List<SubTreeBean>>[];
  }

}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [curPage : 1]
  int get curPage => getValue("curPage");
  set curPage(int value) => setValue("curPage", value);

  /// [key : value] => [offset : 0]
  int get offset => getValue("offset");
  set offset(int value) => setValue("offset", value);

  /// [key : value] => [over : false]
  bool get over => getValue("over");
  set over(bool value) => setValue("over", value);

  /// [key : value] => [pageCount : 3]
  int get pageCount => getValue("pageCount");
  set pageCount(int value) => setValue("pageCount", value);

  /// [key : value] => [size : 20]
  int get size => getValue("size");
  set size(int value) => setValue("size", value);

  /// [key : value] => [total : 41]
  int get total => getValue("total");
  set total(int value) => setValue("total", value);

  /// [key : value] => [datas : null]
  List<DatasBean> get datas => getValue("datas");
  set datas(List<DatasBean> value) => setValue("datas", value);

  DataBean.fromJson([Map<String, dynamic> ?json]) {
    fromJson(json);
    DatasBean.fromJson();
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

class DatasBean with JsonHolderImpl<DatasBean> {
  /// [key : value] => [adminAdd : false]
  bool get adminAdd => getValue("adminAdd");
  set adminAdd(bool value) => setValue("adminAdd", value);

  /// [key : value] => [apkLink : ]
  String get apkLink => getValue("apkLink");
  set apkLink(String value) => setValue("apkLink", value);

  /// [key : value] => [audit : 1]
  int get audit => getValue("audit");
  set audit(int value) => setValue("audit", value);

  /// [key : value] => [author : ]
  String get author => getValue("author");
  set author(String value) => setValue("author", value);

  /// [key : value] => [canEdit : false]
  bool get canEdit => getValue("canEdit");
  set canEdit(bool value) => setValue("canEdit", value);

  /// [key : value] => [chapterId : 60]
  int get chapterId => getValue("chapterId");
  set chapterId(int value) => setValue("chapterId", value);

  /// [key : value] => [chapterName : Android Studio相关]
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

  /// [key : value] => [id : 12871]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [isAdminAdd : false]
  bool get isAdminAdd => getValue("isAdminAdd");
  set isAdminAdd(bool value) => setValue("isAdminAdd", value);

  /// [key : value] => [link : https://juejin.im/post/5e94815551882573af79b2a0]
  String get link => getValue("link");
  set link(String value) => setValue("link", value);

  /// [key : value] => [niceDate : 2020-04-14 00:05]
  String get niceDate => getValue("niceDate");
  set niceDate(String value) => setValue("niceDate", value);

  /// [key : value] => [niceShareDate : 2020-04-13 23:58]
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

  /// [key : value] => [publishTime : 1586793921000]
  int get publishTime => getValue("publishTime");
  set publishTime(int value) => setValue("publishTime", value);

  /// [key : value] => [realSuperChapterId : 150]
  int get realSuperChapterId => getValue("realSuperChapterId");
  set realSuperChapterId(int value) => setValue("realSuperChapterId", value);

  /// [key : value] => [selfVisible : 0]
  int get selfVisible => getValue("selfVisible");
  set selfVisible(int value) => setValue("selfVisible", value);

  /// [key : value] => [shareDate : 1586793515000]
  int get shareDate => getValue("shareDate");
  set shareDate(int value) => setValue("shareDate", value);

  /// [key : value] => [shareUser : 鸿洋]
  String get shareUser => getValue("shareUser");
  set shareUser(String value) => setValue("shareUser", value);

  /// [key : value] => [superChapterId : 60]
  int get superChapterId => getValue("superChapterId");
  set superChapterId(int value) => setValue("superChapterId", value);

  /// [key : value] => [superChapterName : 开发环境]
  String get superChapterName => getValue("superChapterName");
  set superChapterName(String value) => setValue("superChapterName", value);

  /// [key : value] => [title : 数据库还可以这么看？（Android Studio 4.1 新特性）]
  String get title => getValue("title");
  set title(String value) => setValue("title", value);

  /// [key : value] => [type : 0]
  int get type => getValue("type");
  set type(int value) => setValue("type", value);

  /// [key : value] => [userId : 2]
  int get userId => getValue("userId");
  set userId(int value) => setValue("userId", value);

  /// [key : value] => [visible : 1]
  int get visible => getValue("visible");
  set visible(int value) => setValue("visible", value);

  /// [key : value] => [zan : 0]
  int get zan => getValue("zan");
  set zan(int value) => setValue("zan", value);

  /// [key : value] => [tags : null]
  List get tags => getValue("tags");
  set tags(List value) => setValue("tags", value);

  DatasBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<DatasBean> provideCreator(Map<String, dynamic> json) {
    return DatasBean.fromJson(json);
  }

  @override
  List<DatasBean> provideListCreator() {
    return <DatasBean>[];
  }

  @override
  List<List<DatasBean>> provideListListCreator() {
    return <List<DatasBean>>[];
  }

}

