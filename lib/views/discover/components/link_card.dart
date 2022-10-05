part of './discover_components.dart';

class _LinkCard extends StatelessWidget {
  const _LinkCard({
    required String text,
    required String link,
    Key? key,
  })  : _text = text,
        _link = link,
        super(key: key);

  final String _text, _link;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: _launchUrl,
      child: Card(
        elevation: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          width: double.infinity,
          color: BethColors.secondary1,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.link,
                  size: 14,
                  color: Colors.grey.shade700,
                ),
                const SizedBox(width: 5),
                Text(
                  _text,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchUrl() {
    BethUtils.getLogger('LinkCard').v('📤 launching webview with url: $_link');
    Get.to(BethWebView(link: _link));
  }
}
