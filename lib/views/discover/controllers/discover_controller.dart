part of '../components/discover_components.dart';

class DiscoverController extends GetxController {
  List<Bethapi>? _sections = [];

  List<Bethapi>? get sections => _sections;

  Map<Widget, Widget>? get tabs {
    Map<Widget, Widget> tabs = {};
    _sections?.forEach(
      (e) {
        tabs.addAll(
          {
            /// tab
            _BethTab(text: e.sectionName ?? 'discover'):

                /// tabview
                _Section(
              sectionContent: e.sectionContent ?? [],
            )
          },
        );
      },
    );

    return tabs;
  }

  int get length => _sections?.length ?? 1;

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  void _fetchData() async {
    _sections = await BethapiController().fetchData();
    update();
  }
}
