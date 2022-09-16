part of './settings_components.dart';

class _UserTile extends StatelessWidget {
  const _UserTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const UserAvatar(radius: 64),
      const SizedBox(width: 20),
      GetX(
        init: CurrentUserController(),
        builder: (CurrentUserController _) => Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _.data.name ?? BethConst.nameFallBack,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                _.data.email ?? BethConst.nameFallBack,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
