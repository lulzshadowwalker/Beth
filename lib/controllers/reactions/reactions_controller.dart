import 'package:beth/helpers/beth_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

class ReactionsController extends GetxController {
  static const _reactionsMap = BethAnimations.reactions;
  final _reactions = List.generate(
    _reactionsMap.length,
    (index) => Reaction(
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Lottie.asset(
          _reactionsMap.values.elementAt(index),
          height: 32,
          width: 32,
        ),
      ),
      value: _reactionsMap.keys.elementAt(index),
    ),
  );

  List<Reaction<String>> get reactions => _reactions;

  String? _selectedReaction;

  String? get selectedReaction => _selectedReaction;

  set selectedReaction(String? selectedReaction) {
    _selectedReaction = selectedReaction;
    update();
  }

  Widget? get selectedReactionWidget {
    if (_selectedReaction == null) return null;

    return reactions.firstWhere((e) => e.value == _selectedReaction).icon;
  }
}
