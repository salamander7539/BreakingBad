import 'package:breaking_bad_app/data/models/from_api/actor/actor_model.dart';
import 'package:get/get.dart';

import '../data/services/actor_service.dart';
import '../internal/locator.dart';

class ActorController extends GetxController {
  final _service = locator<ActorService>();

  final loaded = false.obs;

  late List<ActorsModel> _actorList;
  late RxList<ActorsModel> actorList;

  Future getAuthors() async {
    loaded.value = false;

    final data = await _service.getAuthors();

    if (data != null) {
      _actorList = data;
      actorList = _actorList.obs;
    }

    loaded.value = true;
  }


  @override
  void onInit() {
    super.onInit();
    getAuthors();
  }

}