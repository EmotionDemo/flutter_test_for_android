import 'package:html/parser.dart';

/// @Description: 去除[标题]字符串中的html标签
/// @Author: 李丰华
/// @CreateDate: 2023/1/10 20:25
String parseHtmlString(String htmlString) {
  var document = parse(htmlString);
  String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}