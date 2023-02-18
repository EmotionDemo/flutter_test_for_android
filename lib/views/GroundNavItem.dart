import 'package:android_play_flutter/views/toast.dart';
import 'package:flutter/material.dart';

import '../pages/beans/ArticleNav.dart';


/// @Description:知识点分类
/// @Author: 李丰华
/// @CreateDate: 2023/1/30 16:58
class ClassifyNavTypeWidget extends StatefulWidget {
  ClassifyNavTypeWidget({Key? key, required this.dataBean}) : super(key: key);
  DataBean dataBean;

  @override
  State<ClassifyNavTypeWidget> createState() => _ClassifyNavTypeWidgetState();
}

class _ClassifyNavTypeWidgetState extends State<ClassifyNavTypeWidget> {
  List<Widget> _getArticleTitleList() {
    List<Widget> articleTitles = [];
    var articles = widget.dataBean.articles;
    for (int i = 0; i < articles.length; i++) {
        articleTitles.add(GestureDetector(
          child: Chip(label: Text(articles[i].title),),
          onTap: () {
            Navigator.pushNamed(context, "/article", arguments: {
              "title": articles[i].title,
              "link": articles[i].link,
            });
            ToastUtil.showToast(message: "${articles[i].link}");
          },
        ));

    }
    return articleTitles;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(3),
          elevation: 1,
          child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.dataBean.name,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        children: _getArticleTitleList().toList(),
                      ),
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
