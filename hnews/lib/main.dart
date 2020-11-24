import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hnews/models/stories.dart';
import 'package:hnews/widgets/pages/feed_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color(0xFFFF6600),
      title: 'Hacker News',
      home: MainTab(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainTab extends StatelessWidget {
  MainTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        activeColor: Colors.redAccent[400],
        inactiveColor: Colors.white,
        items: [
          BottomNavigationBarItem(label: "Top", icon: Icon(Icons.grade, size: 16, color: Colors.white)),
          BottomNavigationBarItem(
              label: "Newest", icon: Icon(Icons.new_releases, size: 16, color: Colors.white)),
          BottomNavigationBarItem(label: "Jobs", icon: Icon(Icons.people, size: 16, color: Colors.white)),
          BottomNavigationBarItem(label: "Shows", icon: Icon(Icons.slideshow, size: 16, color: Colors.white)),
          BottomNavigationBarItem(
              label: "Asks", icon: Icon(Icons.question_answer, size: 16, color: Colors.white))
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return FeedPage(story: Stories.top);
          case 1:
            return FeedPage(story: Stories.newest);
          case 2:
            return FeedPage(story: Stories.jobs);
          case 3:
            return FeedPage(story: Stories.shows);
          case 4:
            return FeedPage(story: Stories.asks);
          default:
            return Container();
            break;
        }
      },
    );
  }
}
