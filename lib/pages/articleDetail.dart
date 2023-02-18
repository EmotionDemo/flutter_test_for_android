import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ArticleDetailView extends StatefulWidget {
  const ArticleDetailView({Key? key, required this.arguments})
      : super(key: key);

  final Map arguments;

  @override
  State<ArticleDetailView> createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {
  double _loadProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black54,
          ),
        ),
        title: Text(
          '${widget.arguments['title']}',
          style: const TextStyle(color: Colors.black54, fontSize: 15),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Column(
        children: [
          Container(
              child: _loadProgress < 100.0
                  ? Column(
                      children: [
                        LinearProgressIndicator(
                          value: _loadProgress / 100,
                          color: Colors.yellow,
                        ),
                        Text(
                          '正在加载中($_loadProgress%) 请稍后....',
                          style: const TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    )
                  : Container()),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse("${widget.arguments['link']}"),
              ),
              onProgressChanged: (controller, progress) {
                setState(() {
                  _loadProgress = progress.toDouble();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
