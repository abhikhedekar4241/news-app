import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/SizeConfig.dart';
import 'package:news_app/article_webview.dart';

class BuildArticleCard extends StatelessWidget {
  BuildArticleCard({@required this.articleData});
  final Map articleData;

  final List colors = [
    0xFFFFA3C1,
    0xFFFFBBBB,
    0xFFB1F2EC,
  ];

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int i = random.nextInt(colors.length);
    int color = colors[i];
    String publishedAt = articleData['publishedAt'];
    return GestureDetector(
      onTap: () {
        if (articleData['url'] != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ArticleWebView(
                url: articleData['url'],
              ),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(color),
//          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            articleData['urlToImage'] != null
                ? Center(
                    child: Image.network(
                      articleData['urlToImage'],
                      fit: BoxFit.contain,
                      height: 50 * SizeConfig.imageSizeMultiplier,
//                      width: double.infinity,
                    ),
                  )
                : Container(),
            SizedBox(
              height: 10.0,
            ),
            Text(
              articleData['description'] ?? '',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              articleData['title'] ?? '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Time: ${publishedAt.substring(11, 16)}' ?? '',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Date: ${publishedAt.substring(0, 10)}' ?? '',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
