import 'package:beth/controllers/posts/posts_controller.dart';
import 'package:beth/helpers/beth_const.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/locale/beth_translations.dart';
import 'package:beth/models/beth_post.dart';
import 'package:beth/themes/beth_colors.dart';
import 'package:beth/views/add_post.dart/add_post.dart';
import 'package:beth/views/home/components/home_components.dart';
import 'package:beth/views/shared/beth_animated_header/beth_animated_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../controllers/active_tag/active_tag_controller.dart';
import '../../beth_home/components/beth_home_components.dart';
import '../../shared/post/components/post_components.dart';

part '../community_wall.dart';
part 'add_post_floating_button.dart';
part 'feed.dart';
part 'popular_posts.dart';
part 'posts_grid_view.dart';
