//******************************************************************
//**************************** Generate By JsonToDartBean  **********
//**************************** Sun Jan 01 09:24:04 CST 2023  **********
//******************************************************************

import 'package:json_holder_impl/json_holder_impl.dart';

class BannerEntity with JsonHolderImpl<BannerEntity> {
  /// [key : value] => [errorCode : 0]
  int get errorCode => getValue("errorCode");

  set errorCode(int value) => setValue("errorCode", value);

  /// [key : value] => [errorMsg : ]
  String get errorMsg => getValue("errorMsg");

  set errorMsg(String value) => setValue("errorMsg", value);

  /// [key : value] => [data : null]
  List<DataBean> get data => getValue("data");

  set data(List<DataBean> value) => setValue("data", value);

  BannerEntity.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
    DataBean.fromJson();
  }

  @override
  JsonHolderImpl<BannerEntity> provideCreator(Map<String, dynamic> json) {
    return BannerEntity.fromJson(json);
  }

  @override
  List<BannerEntity> provideListCreator() {
    return <BannerEntity>[];
  }

  @override
  List<List<BannerEntity>> provideListListCreator() {
    return <List<BannerEntity>>[];
  }
}

class DataBean with JsonHolderImpl<DataBean> {
  /// [key : value] => [desc : 我们支持订阅啦~]
  String get desc => getValue("desc");

  set desc(String value) => setValue("desc", value);

  /// [key : value] => [id : 30]
  int get id => getValue("id");

  set id(int value) => setValue("id", value);

  /// [key : value] => [imagePath : https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png]
  String get imagePath => getValue("imagePath");

  set imagePath(String value) => setValue("imagePath", value);

  /// [key : value] => [isVisible : 1]
  int get isVisible => getValue("isVisible");

  set isVisible(int value) => setValue("isVisible", value);

  /// [key : value] => [order : 2]
  int get order => getValue("order");

  set order(int value) => setValue("order", value);

  /// [key : value] => [title : 我们支持订阅啦~]
  String get title => getValue("title");

  set title(String value) => setValue("title", value);

  /// [key : value] => [type : 0]
  int get type => getValue("type");

  set type(int value) => setValue("type", value);

  /// [key : value] => [url : https://www.wanandroid.com/blog/show/3352]
  String get url => getValue("url");

  set url(String value) => setValue("url", value);

  DataBean.fromJson([Map<String, dynamic>? json]) {
    fromJson(json);
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
