import 'package:beth/views/beth_webview/beth_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class BethMarkdownBody extends StatelessWidget {
  const BethMarkdownBody({
    required String data,
    Key? key,
  })  : _data = data,
        super(key: key);

  final String _data;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
        onTapLink: (link, _, __) => _onTapLink(link), data: _data);
  }

  void _onTapLink(String link) {
    if (GetUtils.isURL(link)) {
      Get.to(BethWebView(link: link));
    }
  }
}
