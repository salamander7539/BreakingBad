import 'package:breaking_bad_app/presentation/ActorScreen/controller/actor_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActorImageScreen extends StatelessWidget {
  const ActorImageScreen({Key? key, @required this.id}) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActorImageController());
    controller.getAuthorsById(id: id!);
    return Obx(() {
      if (controller.loaded.isTrue) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.actor.name!),
            centerTitle: true,
          ),
          body: Image.network(controller.actor.img!),
        );
      } return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}
