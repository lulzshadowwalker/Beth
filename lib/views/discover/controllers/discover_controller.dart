part of '../components/discover_components.dart';

class DiscoverController extends GetxController {
  List<BethSection>? _sections = [];

  @override
  void onInit() async {
    super.onInit();
    _fetchData();
  }

  void _fetchData() async {
    _sections = await RemoteDbController().fetchDiscover;
    update();
  }

  List<BethSection>? get sections => _sections;

  int get length {
    final int secLength = _sections?.length ?? 1;

    return secLength != 0 ? secLength : 1;
  }

  Map<Widget, Widget>? get tabs {
    if (_sections?.isEmpty ?? true) return null;

    Map<Widget, Widget> tabs = {};

    for (var e in _sections!) {
      tabs.addAll(
        {
          /// tab
          _BethTab(text: e.sectionName ?? 'discover'):

              /// tabview
              _Section(
            sectionContent: e.entryContent ?? [],
          )
        },
      );
    }

    return tabs;
  }
}
