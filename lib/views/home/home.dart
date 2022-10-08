part of './components/home_components.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String tag = 'discover';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    ActiveTagController.tag = Home.tag;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            GetBuilder(
              init: DiscoverController(),
              builder: (DiscoverController _) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _.length,
                  itemBuilder: (context, index) {
                    final section = _.sections?[index];
                    return HomeSection(
                      title:
                          section?.sectionName ?? BethTranslations.cDiscover.tr,
                      body: SizedBox(
                        height: Get.height * 0.25,
                        child: DiscoverSection(
                          scrollDirection: Axis.horizontal,
                          sectionContent: section?.entryContent ?? [],
                        ),
                      ),
                    );
                  },
                );
              },
            ),

            //
            const HomeSection(
              title: 'Recent acTity',
              body: Feed(itemCount: 4),
            ),
          ],
        ),
      ),
    );
  }
}
