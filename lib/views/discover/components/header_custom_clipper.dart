part of './discover_components.dart';

class _HeaderCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(0, size.height * 0.7500000, 0, size.height);
    path0.cubicTo(
        size.width * 0.0004141,
        size.height * 0.8824186,
        size.width * 1.0018774,
        size.height * 0.8833953,
        size.width * 0.9994478,
        size.height);
    path0.quadraticBezierTo(size.width * 0.9994478, size.height * 0.7500000,
        size.width * 0.9994478, 0);
    path0.lineTo(0, 0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
