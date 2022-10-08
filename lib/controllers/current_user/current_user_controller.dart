import 'package:beth/controllers/database/remote/remote_db_controller.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/models/beth_user.dart';
import 'package:get/get.dart';

import '../../models/beth_post.dart';
import '../../models/entry_content.dart';

class UserController extends GetxController {
  final _log = BethUtils.getLogger('CurrentUserController');
  final _user = BethUser.empty().obs;
  final _bookmarks = <EntryContent>[].obs;
  final _posts = <BethPost>[].obs;

  BethUser get data => _user.value;
  List<EntryContent> get bookmarks => _bookmarks.value;
  List<BethPost> get posts => _posts.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(RemoteDbController().currentUserData());
    _bookmarks.bindStream(RemoteDbController().bookmarks()!);
    _fetchPosts();
  }

  void _fetchPosts() {
    try {
      _posts.bindStream(RemoteDbController().fetchUserPosts!);
    } catch (e) {
      _log.e(e.toString());
    }
  }
}
