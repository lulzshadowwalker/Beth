import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BethWebView extends StatelessWidget {
  const BethWebView({
    required String link,
    String? title,
    Key? key,
  })  : _link = link,
        _title = title,
        super(key: key);

  final String _link;
  final String? _title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title ?? '',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: WebView(
        initialUrl: _link,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
