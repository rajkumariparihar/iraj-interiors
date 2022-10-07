import 'package:flutter/material.dart';

import 'tab_entity.dart';

typedef void OnPageChanged(int position);

class TabWidget extends StatefulWidget {
  final List<TabEntity> entity;
  final OnPageChanged? onPageChanged;
  final List<Widget> children;
  final Color tabColor;
  final double tabHeight;
  final Color tabTextSelectColor;
  final Color tabTextUnSelectColor;
  final int initialPage;
  final bool scrooll;
  final EdgeInsetsGeometry? tabMargin;

  TabWidget(
      {Key? key,
      required this.entity,
      required this.children,
      this.scrooll = false,
      this.tabMargin,
      this.tabTextSelectColor = Colors.white,
      this.tabTextUnSelectColor = Colors.white70,
      this.onPageChanged,
      this.tabColor = Colors.blue,
      this.tabHeight = 50.0,
      this.initialPage = 0})
      : assert(entity.length == children.length,
            'please check entity or children length'),
        super(key: key);

  @override
  State<StatefulWidget> createState() => TabState();
}

class TabState extends State<TabWidget> {
  PageController? controller;
  int selectIndex = 0;
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    controller = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      Container(
          height: widget.tabHeight,
          color: widget.tabColor,
          margin: widget.tabMargin,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.entity.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  child: widget.scrooll
                      ? Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                          child: Text(
                            widget.entity[index].title,
                            style: TextStyle(
                                color: selectIndex == index
                                    ? widget.tabTextSelectColor
                                    : widget.tabTextUnSelectColor),
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          width: size.width / widget.entity.length,
                          child: Text(
                            widget.entity[index].title,
                            style: TextStyle(
                                fontSize: 18,
                                color: selectIndex == index
                                    ? widget.tabTextSelectColor
                                    : widget.tabTextUnSelectColor),
                          ),
                        ),
                  onTap: () {
                    selectIndex = index;
                    setState(() {});
                    controller!.jumpToPage(index);
                  });
            },
          )),
      Expanded(
          child: PageView.builder(
        itemCount: widget.entity.length,
        controller: controller,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) => widget.children[index],
      )),
    ]);
  }

  onPageChanged(int index) {
    selectIndex = index;
    setState(() {});
    if (widget.scrooll) {
      scrollController.animateTo(
        (60 * index).toDouble(),
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
    if (widget.onPageChanged != null) widget.onPageChanged!(selectIndex);
  }

  @override
  void dispose() {
    controller?.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
