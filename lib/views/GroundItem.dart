import 'package:android_play_flutter/views/toast.dart';
import 'package:flutter/material.dart';

import '../pages/beans/ArticleType.dart';

/// @Description:知识点分类
/// @Author: 李丰华
/// @CreateDate: 2023/1/30 16:58
class ClassifyTypeWidget extends StatefulWidget {
  ClassifyTypeWidget({Key? key, required this.dataBean}) : super(key: key);
  DataBean dataBean;

  @override
  State<ClassifyTypeWidget> createState() => _ClassifyTypeWidgetState();
}

class _ClassifyTypeWidgetState extends State<ClassifyTypeWidget> {
  List<Widget> _getArticleTitleList() {
    List<Widget> articleTitles = [];
    var children = widget.dataBean.children;
    for (int i = 0; i < children.length; i++) {
      if(children[i].name.isNotEmpty){
        articleTitles.add(GestureDetector(
          key: GlobalKey(),
          child: Chip(label: Text(children[i].name),),
          onTap: () {

            ToastUtil.showToast(message: "${children[i].id}");
          },
        ));
      }

    }
    return articleTitles;
  }

  @override
  Widget build(BuildContext context) {
    var list = _getArticleTitleList().toList();
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
                        children: list,
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
