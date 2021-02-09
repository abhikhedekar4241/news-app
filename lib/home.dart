import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/articles.dart';

import 'SizeConfig.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;

  Color bgColor = Colors.white;
  Color textColor = Colors.black;

  @override
  void initState() {
    super.initState();
    // Controller for TabBar
    tabController = TabController(length: 10, vsync: this);
  }

//  @override
//  void dispose() {
//    tabController.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width:
            kIsWeb ? (screenSize.width > 500 ? 500 : screenSize.width) : null,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text(
              'News App',
              style: TextStyle(
//              color: textColor,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            iconTheme: new IconThemeData(color: textColor),
          ),
          backgroundColor: bgColor,
          body: Column(
            children: <Widget>[
              //All 10 Tabs defined
              TabBar(
                  controller: tabController,
                  indicatorColor: Colors.green,
                  indicatorWeight: 3.0,
                  labelColor: textColor,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        "The Hindu",
                        style: kTabBarTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "New Scientist",
                        style: kTabBarTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Times of India",
                        style: kTabBarTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "CNN",
                        style: kTabBarTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "BBC News",
                        style: kTabBarTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Fox News",
                        style: kTabBarTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Google News",
                        style: kTabBarTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "BBC Sport",
                        style: kTabBarTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "New York Magazine",
                        style: kTabBarTextStyle,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Next Big Future",
                        style: kTabBarTextStyle,
                      ),
                    ),
                  ]),
              Expanded(
                child: Container(
                  child:
                      TabBarView(controller: tabController, children: <Widget>[
                    // Parameter source in Article Widget is news source. ' '(space) replaced by '-'(hyphen).
                    Articles(
                      source: 'The-Hindu',
                    ),
                    Articles(
                      source: 'New-Scientist',
                    ),
                    Articles(
                      source: 'The-Times-of-India',
                    ),
                    Articles(
                      source: 'CNN',
                    ),
                    Articles(
                      source: 'BBC-News',
                    ),
                    Articles(
                      source: 'Fox-News',
                    ),
                    Articles(
                      source: 'Google-News',
                    ),
                    Articles(
                      source: 'BBC-Sport',
                    ),
                    Articles(
                      source: 'New-York-Magazine',
                    ),
                    Articles(
                      source: 'Next-Big-Future',
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
