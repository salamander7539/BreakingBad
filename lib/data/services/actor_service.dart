import 'package:breaking_bad_app/data/models/from_api/actor/actor_model.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/dialogs.dart';
import '../../internal/locator.dart';
import '../api/core_api.dart';

class ActorService {
  final CoreApi _coreApi = locator<CoreApi>();

  Future<List<ActorsModel>?> getAuthors() async {
    final url = _coreApi.actorsUrl;

    final result = await _coreApi.getRequest(
      url,
    );

    if (result.response != null) {
      return (result.response as List)
          .map((x) => ActorsModel.fromJson(x as Map<String, dynamic>))
          .toList();
    } else {
      await ErrorDialog.show(result.error!);
    }
  }
}