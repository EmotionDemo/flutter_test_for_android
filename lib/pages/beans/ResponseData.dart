
//******************************************************************
//**************************** Generate By JsonToDartBean  **********
//**************************** Sat Jan 14 16:22:15 CST 2023  **********
//******************************************************************

import 'package:json_holder_impl/json_holder_impl.dart';

class ResponseData with JsonHolderImpl<ResponseData> {
  /// [key : value] => [errorCode : -1001]
  int get errorCode => getValue("errorCode");
  set errorCode(int value) => setValue("errorCode", value);

  /// [key : value] => [errorMsg : 请先登录！]
  String get errorMsg => getValue("errorMsg");
  set errorMsg(String value) => setValue("errorMsg", value);

  ResponseData.fromJson([Map<String, dynamic> ?json]) {
    fromJson(json);
  }

  @override
  JsonHolderImpl<ResponseData> provideCreator(Map<String, dynamic> json) {
    return ResponseData.fromJson(json);
  }

  @override
  List<ResponseData> provideListCreator() {
    return <ResponseData>[];
  }

  @override
  List<List<ResponseData>> provideListListCreator() {
    return <List<ResponseData>>[];
  }

}

