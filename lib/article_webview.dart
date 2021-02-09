import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:news_app/home.dart';
import 'package:universal_html/html.dart' as html;

import 'SizeConfig.dart';

class ArticleWebView extends StatelessWidget {
  final String url;
  ArticleWebView({@required this.url});

  final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    // Webview plugin does not support Flutter web, therefore opening link in new tab
    if (kIsWeb) {
      html.window.open(url, '');
      return Home();
    }
    flutterWebviewPlugin.reloadUrl(url);

    // Open WebView in App itself
    return WebviewScaffold(
      initialChild: Center(
        child: CircularProgressIndicator(),
      ),
      url: url,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'News Details',
          style: TextStyle(
//              color: textColor,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 2.5 * SizeConfig.textMultiplier,
          ),
        ),
      ),
      withZoom: true,
    );
  }
}
