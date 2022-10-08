import 'package:beth/controllers/database/remote/remote_db_controller.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/models/beth_post.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  final _posts = <BethPost>[].obs;
  final _log = BethUtils.getLogger('PostsController');

  List<BethPost> get posts => _posts.value;
  int get length => _posts.length;

  @override
  void onInit() {
    super.onInit();
    _fetchPosts();
  }

  void _fetchPosts() {
    try {
      _posts.bindStream(RemoteDbController().fetchPosts!);
    } catch (e) {
      _log.e(e.toString());
    }
  }
}
