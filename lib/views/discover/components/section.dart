part of './discover_components.dart';

class Section extends StatelessWidget {
  const Section({
    required List<EntryContent> sectionContent,
    Key? key,
  })  : _sectionContent = sectionContent,
        super(key: key);

  final List<EntryContent> _sectionContent;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          _sectionContent.length,
          (index) => _PreviewCard(
            index: index,
            entryContent: _sectionContent[index],
          ),
        ),
      ),
    );
  }
}
