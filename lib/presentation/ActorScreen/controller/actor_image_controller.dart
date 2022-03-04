import 'package:breaking_bad_app/data/models/from_api/actor/actor_model.dart';
import 'package:breaking_bad_app/data/services/actor_service.dart';
import 'package:breaking_bad_app/internal/locator.dart';
import 'package:get/get.dart';

class ActorImageController extends GetxController {
  final _service = locator<ActorService>();

  final loaded = false.obs;

  late ActorsModel actor;
  late List<ActorsModel> _actorsList;

  Future getAuthorsById({required int id}) async {
    loaded.value = false;

    final data = await _service.getAuthorsById(id: id);

    if (data != null) {
      _actorsList = data;
      actor = _actorsList[0];
    }

    loaded.value = true;
  }
}