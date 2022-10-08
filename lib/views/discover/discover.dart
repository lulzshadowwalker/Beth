part of './components/discover_components.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);
  static const String tag = 'discover';

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = Discover.tag;
  }

  @override
  Widget build(BuildContext context) {
    return BethScaffold(
      backgroundColor: BethColors.secondary1,
      lightAppBarLeading: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header(),
          GetBuilder(
            init: DiscoverController(),
            builder: (DiscoverController _) {
              final controller = TabController(length: _.length, vsync: this);

              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TabBarView(
                        controller: controller,
                        children: _.tabs?.values.toList() ?? [Container()],
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: SingleChildScrollView(
                        child: BethTabBar(
                          tabController: controller,
                          isScrollable: false,
                          labelPadding:
                              const EdgeInsets.fromLTRB(35, 30, 35, 10),
                          padding: const EdgeInsets.only(bottom: 30),
                          tabs: _.tabs?.keys.toList() ?? [Container()],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
