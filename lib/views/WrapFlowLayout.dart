import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';

typedef OnItemClick = void Function(int index);

class WrapFlowLayout extends StatefulWidget {
  //最低折叠行数
  final int minLines;
  //数据源
  final List<String> data;
  final OnItemClick onItemClick;

  const WrapFlowLayout({Key? key, required this.minLines, required this.data, required this.onItemClick}) : super(key: key);

  @override
  State<WrapFlowLayout> createState() => _WrapFlowLayout();
}

class _WrapFlowLayout extends State<WrapFlowLayout> {
  late int minLines;
  late int maxLines;
  bool isExpand = false;
  late List<String> flowLayoutData;
  int selectedPosition = 0;
  final double elementsPadding = 6.0;

  @override
  void initState() {
    super.initState();
    // 首次赋值必须跟maxLines相等， 解决有overflowWidget 隐藏与展开问题
    minLines = widget.minLines;
    maxLines = minLines;
    flowLayoutData = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedWrap(
      maxLines: maxLines,
      minLines: minLines,
      runSpacing: elementsPadding,
      spacing: elementsPadding,
      alignment: WrapAlignment.start,
      overflowWidget: _buildActionButton(),
      children: List.generate(flowLayoutData.length, (index) => _buildChipItem(index)),
    );
  }

  Widget _buildChipItem(int index) {
    return GestureDetector(
      onTap: () {
        widget.onItemClick(index);
        setState(() {
          selectedPosition = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
        height: 36,
        child: Chip(
          backgroundColor: selectedPosition == index ? Colors.blueAccent : Colors.white,
          side: BorderSide(color: selectedPosition == index ? Colors.blueAccent : const Color(0xFFE0E0E0)),
          label: Text(
            flowLayoutData[index],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: selectedPosition == index ? Colors.white : Colors.black87, height: 1.0),
          ),
        ),
      ),
    );
  }

  _buildActionButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpand = !isExpand;
          maxLines = (isExpand ? flowLayoutData.length : minLines);
        });
      },
      child: isExpand
          ? Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: const Text(
          "更多",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 14,
          ),
        ),
      )
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: elementsPadding),
        child: const Text(
          "展开",
          style: TextStyle(color: Colors.blueAccent, fontSize: 14),
        ),
      ),
    );
  }
}