import 'package:android_play_flutter/views/FlowLayout.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<String> list =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      list  = ["123123", "2323", "3434", "3434", "2323", "cxxcxc", "2323", "cxxcxc", "2323", "cxxcxc", "2323", "cxxcxc"];
    });
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      list  = ["123123", "2323", "3434", "3434", "2323", "cxxcxc", "2323", "cxxcxc", "2323", "cxxcxc", "2323", "cxxcxc"
      ,"1111111"
      ];
    });
    return Center(
      child: FlowLayout(
        list: list,
        unSelectedColor: Colors.black,
        selectColor: Colors.blue,
        unSelectedBorderSlideColor: Colors.black54,
        selectedBorderSlideColor: Colors.blue,
        maxSelectSize: 22,
        borderRadius: 10,
        textSize: 16,
        selectedTextColor: Colors.blue,
        unSelectTextColor: Colors.black,
        marge: 10,
        listener: ItemClick(),
      ),
    );
  }
}

class ItemClick implements OnItemClickListener{
  @override
  onItemClick(List<String> list) {
  }

}