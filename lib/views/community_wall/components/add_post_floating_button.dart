part of './community_wall_components.dart';

class _AddPostFloatingButton extends StatelessWidget {
  const _AddPostFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 22.0, vertical: Get.height * 0.15),
      child: Bounceable(
        onTap: () {
          /// do nothing, merely cosmetic for visuals.
        },
        child: FloatingActionButton(
          onPressed: () => Get.to(() => const AddPost()),
          backgroundColor: BethColors.secondary1,
          splashColor: BethColors.accent,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
