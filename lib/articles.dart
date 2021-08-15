import 'dart:convert';

import 'package:async_loader/async_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/build_article_card.dart';

class Articles extends StatelessWidget {
  final String source;
  Articles({@required this.source});

  // Async Loader for handling scenarios like NoInternet, showing CircularProgressIndicator till load is complete.
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  loadData() async {
    final String apiKey = 'YOUR_API_KEY';
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$source&apiKey=$apiKey';

    http.Response response = await http.get(url).catchError((e) => print(e));
    // News JSON response conversion and handling for null response, same for List data
    Map dataMap = jsonDecode(response.body) ?? {};
    List data = dataMap['articles'] ?? [];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // Async Loader with different steps in loading
    var _asyncLoader = AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await loadData(),
      renderLoad: () => Center(child: CircularProgressIndicator()),
      renderError: ([error]) => noConnectionWidget(),
      renderSuccess: ({data}) => articleList(data),
    );
    return _asyncLoader;
  }

  Widget articleList(List articles) {
    List<Widget> articleWidgetList = [];
    for (int i = 0; i < articles.length; i++) {
      if (articles[i] != null) {
        final Widget articleWidget = BuildArticleCard(articleData: articles[i]);

        articleWidgetList.add(articleWidget);
        articleWidgetList.add(
          SizedBox(
            height: 15.0,
          ),
        );
      }
    }
    return RefreshIndicator(
      onRefresh: () async {
        // Pull down refresh, Async loader state reload
        await _asyncLoaderState.currentState.reloadState();
        return;
      },
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: articleWidgetList,
        ),
      ),
    );
  }

  // When internet connection error, Button for retry is provided
  Widget noConnectionWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You are not connected to the internet !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          FlatButton(
              color: Colors.blueAccent,
              onPressed: () {
                _asyncLoaderState.currentState
                    .reloadState()
                    .whenComplete(() => print('finished reload'));
              },
              child: Text(
                'Try Again',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
