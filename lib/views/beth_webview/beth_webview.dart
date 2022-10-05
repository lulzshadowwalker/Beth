import 'package:beth/controllers/loading/loading_contorller.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
      body: GetBuilder(
        init: LoadingController(),
        builder: (LoadingController _) => _.isLoading
            ? Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: BethColors.neutral1, size: Get.width * 0.15),
              )
            : WebView(
                initialUrl: _link,
                javascriptMode: JavascriptMode.unrestricted,
                onProgress: (v) {},
                onPageFinished: (v) => _.isLoading = false,
              ),
      ),
    );
  }
}
