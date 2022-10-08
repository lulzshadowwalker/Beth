part of './discover_components.dart';

class _TabViewSection extends StatelessWidget {
  const _TabViewSection({
    Key? key,
    required this.e,
  }) : super(key: key);

  final BethSection e;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 80),
          decoration: BoxDecoration(
            color: BethColors.secondary1Dimmed,
            borderRadius: BorderRadius.only(
              topLeft:
                  BethUtils.isLtr ? Radius.zero : const Radius.circular(25),
              topRight:
                  BethUtils.isLtr ? const Radius.circular(25) : Radius.zero,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 25),
          child: DiscoverSection(
            sectionContent: e.entryContent ?? [],
          ),
        )
      ],
    );
  }
}
