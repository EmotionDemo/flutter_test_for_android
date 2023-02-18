
import 'package:flutter/material.dart';

class Loading extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.black38,
        child: Center(
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Container(
              decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  /*Text(
                    "加载中,请稍后",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  )*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
