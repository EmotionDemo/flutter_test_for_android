import 'dart:async';
import 'package:flutter/material.dart';

class BannerItem{
  String? itemImgDesc;
  Widget? itemTitle;

   BannerItem defaultBannerItem(String imgDesc,String title){
    BannerItem item = BannerItem();
    itemImgDesc = imgDesc;
    Text titleWidget = Text(title,softWrap: true,overflow: TextOverflow.ellipsis,style: const TextStyle(
      color: Colors.white,fontSize: 12,decoration: TextDecoration.none
    ),);
    item.itemTitle = titleWidget;
    return item;
  }
}



//定义item的点击事件
typedef void onBannerItemClick(int positoin,BannerItem item);
