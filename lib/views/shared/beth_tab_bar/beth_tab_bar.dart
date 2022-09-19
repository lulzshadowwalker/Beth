import 'package:flutter/material.dart';

import '../../../helpers/beth_utils.dart';
import '../../../themes/beth_colors.dart';
import '../beth_circle_tab_indicator/beth_circle_tab_indicator.dart';

class BethTabBar extends StatelessWidget {
  const BethTabBar({
    Key? key,
    required TabController tabController,
    EdgeInsets? labelPadding,
    EdgeInsets? padding,
    bool isScrollable = true,
    required List<Widget> tabs,
  })  : _tabController = tabController,
        _labelPadding = labelPadding,
        _isScrollable = isScrollable,
        _padding = padding,
        _tabs = tabs,
        super(key: key);

  final TabController _tabController;
  final EdgeInsets? _labelPadding, _padding;
  final bool _isScrollable;
  final List<Widget> _tabs;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: BethUtils.isLtr ? Alignment.centerLeft : Alignment.centerRight,
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        labelStyle: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: BethColors.lightPrimary1),
        labelColor: BethColors.secondary2,
        labelPadding:
            _labelPadding ?? const EdgeInsets.only(right: 50, bottom: 8),
        unselectedLabelColor: BethColors.muted,
        padding: _padding,
        indicator: BethCircleTabIndicator(color: BethColors.accent1, radius: 5),
        controller: _tabController,
        isScrollable: _isScrollable,
        tabs: _tabs,
      ),
    );
  }
}
