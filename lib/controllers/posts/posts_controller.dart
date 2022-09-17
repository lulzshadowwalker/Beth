import 'package:beth/controllers/database/remote/remote_db_controller.dart';
import 'package:beth/models/beth_post.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  final _posts = <BethPost>[].obs;

  List<BethPost> get posts => _posts.value;
  int get length => _posts.length;

  @override
  void onInit() {
    super.onInit();
    _posts.bindStream(RemoteDbController().posts);
  }
}
