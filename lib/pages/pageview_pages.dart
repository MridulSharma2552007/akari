import 'package:akari/pageviewpages/pageone.dart';
import 'package:flutter/material.dart';

class PageviewPages extends StatefulWidget {
  const PageviewPages({super.key});

  @override
  State<PageviewPages> createState() => _PageviewPagesState();
}

class _PageviewPagesState extends State<PageviewPages> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _pageController, children: [Pageone()]),
    );
  }
}
