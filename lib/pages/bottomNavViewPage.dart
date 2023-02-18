import 'package:android_play_flutter/events/eventBus.dart';
import 'package:android_play_flutter/events/pageChangedEvent.dart';
import 'package:android_play_flutter/pages/minePage.dart';
import 'package:flutter/material.dart';

import 'groundPage.dart';
import 'homePage.dart';
import 'pjoPage.dart';
import 'publicPage.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView>
    with AutomaticKeepAliveClientMixin<BottomNavView> {
  final List<BottomNavigationBarItem> _bottoms = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: 30,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.add_business,
          size: 30,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.wechat,
          size: 30,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.category,
          size: 30,
        ),
        label: ''),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.people_alt_rounded,
          size: 30,
        ),
        label: ''),
  ];

  final List<Widget> _pages = [
    HomePage(),
    const GroundPage(),
    const ProjectPage(),
    const PublicPage(),
    const MinePage()
  ];

  int _position = 0;
  var currentPage;

  @override
  void initState() {
    print('---->initState');
    super.initState();
    currentPage = _pages[_position];
  }

  @override
  void dispose() {
    print('---->dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('---->build');
    return Scaffold(
      body: IndexedStack(
        index: _position,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottoms,
        currentIndex: _position,
        elevation: 20,
        fixedColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (position) {
          setState(() {
            print('position----->$position');
            if (position == 4) {
              eventBus.fire(PageChangedEvent());
            }
            _position = position;
            currentPage = _pages[_position];
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
