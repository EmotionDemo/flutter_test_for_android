//******************************************************************
//**************************** Generate By JsonToDartBean  **********
//**************************** Mon Jan 30 18:44:49 CST 2023  **********
//******************************************************************

import 'package:json_holder_impl/json_holder_impl.dart';

class ArticleType with JsonHolderImpl<ArticleType> {
  /// [key : value] => [errorCode : 0]
  int get errorCode => getValue("errorCode");
  set errorCode(int value) => setValue("errorCode", value);

  /// [key : value] => [errorMsg : ]
  String get errorMsg => getValue("errorMsg");
  set errorMsg(String value) => setValue("errorMsg", value);

  /// [key : value] => [data : null]
  List<DataBean> get data => getValue("data");
  set data(List<DataBean> value) => setValue("data", value);

  ArticleType.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<ArticleType> provideCreator(Map<String, dynamic> json) {
    return ArticleType.fromJson(json);
  }

  @override
  List<ArticleType> provideListCreator() {
    return <ArticleType>[];
  }

  @override
  List<List<ArticleType>> provideListListCreator() {
    return <List<ArticleType>>[];
  }

}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [author : ]
  String get author => getValue("author");
  set author(String value) => setValue("author", value);

  /// [key : value] => [courseId : 13]
  int get courseId => getValue("courseId");
  set courseId(int value) => setValue("courseId", value);

  /// [key : value] => [cover : ]
  String get cover => getValue("cover");
  set cover(String value) => setValue("cover", value);

  /// [key : value] => [desc : ]
  String get desc => getValue("desc");
  set desc(String value) => setValue("desc", value);

  /// [key : value] => [id : 150]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [lisense : ]
  String get lisense => getValue("lisense");
  set lisense(String value) => setValue("lisense", value);

  /// [key : value] => [lisenseLink : ]
  String get lisenseLink => getValue("lisenseLink");
  set lisenseLink(String value) => setValue("lisenseLink", value);

  /// [key : value] => [name : 开发环境]
  String get name => getValue("name");
  set name(String value) => setValue("name", value);

  /// [key : value] => [order : 1]
  int get order => getValue("order");
  set order(int value) => setValue("order", value);

  /// [key : value] => [parentChapterId : 0]
  int get parentChapterId => getValue("parentChapterId");
  set parentChapterId(int value) => setValue("parentChapterId", value);

  /// [key : value] => [type : 0]
  int get type => getValue("type");
  set type(int value) => setValue("type", value);

  /// [key : value] => [userControlSetTop : false]
  bool get userControlSetTop => getValue("userControlSetTop");
  set userControlSetTop(bool value) => setValue("userControlSetTop", value);

  /// [key : value] => [visible : 1]
  int get visible => getValue("visible");
  set visible(int value) => setValue("visible", value);

  /// [key : value] => [articleList : null]
  List get articleList => getValue("articleList");
  set articleList(List value) => setValue("articleList", value);

  /// [key : value] => [children : null]
  List<ChildrenBean> get children => getValue("children");
  set children(List<ChildrenBean> value) => setValue("children", value);

  DataBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    ChildrenBean.fromJson();
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

class ChildrenBean with JsonHolderImpl<ChildrenBean> {
  /// [key : value] => [author : ]
  String get author => getValue("author");
  set author(String value) => setValue("author", value);

  /// [key : value] => [courseId : 13]
  int get courseId => getValue("courseId");
  set courseId(int value) => setValue("courseId", value);

  /// [key : value] => [cover : ]
  String get cover => getValue("cover");
  set cover(String value) => setValue("cover", value);

  /// [key : value] => [desc : ]
  String get desc => getValue("desc");
  set desc(String value) => setValue("desc", value);

  /// [key : value] => [id : 60]
  int get id => getValue("id");
  set id(int value) => setValue("id", value);

  /// [key : value] => [lisense : ]
  String get lisense => getValue("lisense");
  set lisense(String value) => setValue("lisense", value);

  /// [key : value] => [lisenseLink : ]
  String get lisenseLink => getValue("lisenseLink");
  set lisenseLink(String value) => setValue("lisenseLink", value);

  /// [key : value] => [name : Android Studio相关]
  String get name => getValue("name");
  set name(String value) => setValue("name", value);

  /// [key : value] => [order : 1000]
  int get order => getValue("order");
  set order(int value) => setValue("order", value);

  /// [key : value] => [parentChapterId : 150]
  int get parentChapterId => getValue("parentChapterId");
  set parentChapterId(int value) => setValue("parentChapterId", value);

  /// [key : value] => [type : 0]
  int get type => getValue("type");
  set type(int value) => setValue("type", value);

  /// [key : value] => [userControlSetTop : false]
  bool get userControlSetTop => getValue("userControlSetTop");
  set userControlSetTop(bool value) => setValue("userControlSetTop", value);

  /// [key : value] => [visible : 1]
  int get visible => getValue("visible");
  set visible(int value) => setValue("visible", value);

  /// [key : value] => [articleList : null]
  List get articleList => getValue("articleList");
  set articleList(List value) => setValue("articleList", value);

  /// [key : value] => [children : null]
  List  get children => getValue("children");
  set children(List value) => setValue("children", value);

  ChildrenBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<ChildrenBean> provideCreator(Map<String, dynamic> json) {
    return ChildrenBean.fromJson(json);
  }

  @override
  List<ChildrenBean> provideListCreator() {
    return <ChildrenBean>[];
  }

  @override
  List<List<ChildrenBean>> provideListListCreator() {
    return <List<ChildrenBean>>[];
  }

}

