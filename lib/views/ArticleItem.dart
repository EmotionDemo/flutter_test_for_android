import 'package:android_play_flutter/constants/Constants.dart';
import 'package:android_play_flutter/network/httpUtil.dart';
import 'package:android_play_flutter/pages/beans/ResponseData.dart';
import 'package:android_play_flutter/utils/stringUtils.dart';
import 'package:android_play_flutter/views/toast.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem(
      {Key? key,
      required this.title,
      required this.link,
      required this.niceShareDate,
      required this.realName,
      required this.chapterName,
      required this.id,
      required this.collect})
      : super(key: key);

  final title;
  final link;
  final realName;
  final niceShareDate;
  final chapterName;
  final id;
  final collect;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  final collectIcon = const Icon(
    Icons.favorite,
    color: Colors.red,
    size: 26,
  );

  final unCollectIcon = const Icon(
    Icons.favorite,
    color: Colors.black54,
    size: 26,
  );
  bool isCollect = false;

  Widget _setCollectIcon() {
    return isCollect ? collectIcon : unCollectIcon;
  }

  @override
  void initState() {
    super.initState();
    isCollect = widget.collect;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/article",
                arguments: {"title": widget.title, "link": widget.link});
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(5),
            elevation: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      // margin: const EdgeInsets.only(left: 10,top: 10),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          widget.realName,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 16),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              widget.niceShareDate,
                              style: const TextStyle(color: Colors.black54),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20, right: 30),
                  child: Text(
                    parseHtmlString(widget.title),
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        widget.chapterName,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            if (isCollect) {
                              Future<ResponseData> cancelLove =
                                  RequestManager.getInstance()
                                      .disCollectArticle(widget.id);
                              cancelLove.then((value) {
                                if (UN_LOGIN == value.errorCode) {
                                  Navigator.pushNamed(context, "/login");
                                  ToastUtil.showToast(message: value.errorMsg);
                                } else if (value.errorCode == 0) {
                                  //取消点赞成功
                                  setState(() {
                                    isCollect = false;
                                  });
                                }else{
                                  ToastUtil.showToast(message: "发生错误${value.errorMsg}");
                                }
                              });
                            } else {
                              Future<ResponseData> takeLove =
                                  RequestManager.getInstance()
                                      .collectArticle(widget.id);
                              takeLove.then((value) {
                                if (UN_LOGIN == value.errorCode) {
                                  Navigator.pushNamed(context, "/login");
                                  ToastUtil.showToast(message: value.errorMsg);
                                } else if (value.errorCode == 0) {
                                  //点赞成功
                                  setState(() {
                                    isCollect = true;
                                  });
                                }
                              });
                            }
                          },
                          child: _setCollectIcon(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
