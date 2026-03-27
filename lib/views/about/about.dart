import 'package:beth/controllers/about/about_controller.dart';
import 'package:beth/locale/beth_translations.dart';
import 'package:beth/views/shared/beth_markdown_body/beth_markdown_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/beth_colors.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: BethColors.lightPrimary1,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: BethColors.secondary1,
          title: Text(
            BethTranslations.about.tr,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold, color: BethColors.lightPrimary1),
          ),
        ),
        body: GetBuilder(
          init: AboutController(),
          builder: (AboutController _) => Padding(
              padding: const EdgeInsets.all(45),
              child: BethMarkdownBody(data: _.data)),
        ));
  }
}
