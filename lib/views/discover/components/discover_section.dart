part of './discover_components.dart';

class DiscoverSection extends StatelessWidget {
  const DiscoverSection({
    required List<EntryContent> sectionContent,
    Axis scrollDirection = Axis.vertical,
    Key? key,
  })  : _sectionContent = sectionContent,
        _scrollDirection = scrollDirection,
        super(key: key);

  final List<EntryContent> _sectionContent;
  final Axis _scrollDirection;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: _scrollDirection,
      itemCount: _sectionContent.length,
      itemBuilder: (context, index) => _PreviewCard(
        index: index,
        entryContent: _sectionContent[index],
      ),
    );
  }
}
