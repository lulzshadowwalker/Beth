part of './discover_components.dart';

class LaunchMapButton extends StatelessWidget {
  const LaunchMapButton({
    required BethGeoLocation location,
    required String locationTitle,
    Key? key,
  })  : _location = location,
        _locationTitle = locationTitle,
        super(key: key);

  final BethGeoLocation _location;
  final String _locationTitle;

  @override
  Widget build(BuildContext context) {
    return BottomNavBarConstrainedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0),
        child: PhysicalModel(
          color: Colors.transparent,
          elevation: BethUtils.isDarkTheme ? 0 : 8,
          borderRadius: BorderRadius.circular(BethElevatedButton.borderRadius),
          child: BethElevatedButton(
            borderless: false,
            onTap: _launchMaps,
            text: BethTranslations.showOnMap.tr,
          ),
        ),
      ),
    );
  }

  void _launchMaps() async {
    BethUtils.launchMap(
      latitude: _location.latitude!,
      longitude: _location.longitude!,
      title: _locationTitle,
    );
  }
}
