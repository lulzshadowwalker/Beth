part of './post_components.dart';

class CornerReaction extends StatelessWidget {
  const CornerReaction({
    required Widget? reaction,
    Key? key,
  })  : _reaction = reaction,
        super(key: key);

  final Widget? _reaction;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      end: 5,
      bottom: 5,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.35),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              offset: const Offset(0, 3),
              blurRadius: 3,
            )
          ],
        ),
        child: _reaction ?? const SizedBox(),
      ),
    );
  }
}
