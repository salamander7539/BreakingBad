import 'package:breaking_bad_app/data/models/from_api/actor/actor_model.dart';
import 'package:get/get.dart';

import '../../../data/services/actor_service.dart';
import '../../../internal/locator.dart';


class ActorImageController extends GetxController {
  final _service = locator<ActorService>();

  final loaded = false.obs;

  late ActorsModel actorList;

  Future getAuthorsById({required int id}) async {
    loaded.value = false;

    // final data = await _service.getAuthorsById(id: id);

    // if (data != null) {
    //   actorList = data;
    // }

    loaded.value = true;
  }
}