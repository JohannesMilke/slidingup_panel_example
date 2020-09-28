import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:slidingup_panel_example/main.dart';
import 'package:slidingup_panel_example/widget/main_image_widget.dart';
import 'package:slidingup_panel_example/widget/tab_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final panelController = PanelController();
  final double tabBarHeight = 80;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
          elevation: 2,
        ),
        body: SlidingUpPanel(
          controller: panelController,
          maxHeight: MediaQuery.of(context).size.height - tabBarHeight,
          panelBuilder: (scrollController) => buildSlidingPanel(
            scrollController: scrollController,
            panelController: panelController,
          ),
          body: MainImageWidget(),
        ),
      );

  Widget buildSlidingPanel({
    @required PanelController panelController,
    @required ScrollController scrollController,
  }) =>
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: buildTabBar(
            onClicked: panelController.open,
          ),
          body: TabBarView(
            children: [
              TabWidget(scrollController: scrollController),
              TabWidget(scrollController: scrollController),
            ],
          ),
        ),
      );

  Widget buildTabBar({
    @required VoidCallback onClicked,
  }) =>
      PreferredSize(
        preferredSize: Size.fromHeight(tabBarHeight - 8),
        child: GestureDetector(
          onTap: onClicked,
          child: AppBar(
            title: buildDragIcon(), // Icon(Icons.drag_handle),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(child: Text('Vegetarian')),
                Tab(child: Text('Non Vegetarian')),
              ],
            ),
          ),
        ),
      );

  Widget buildDragIcon() => Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 40,
        height: 8,
      );
}
