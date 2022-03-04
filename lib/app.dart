import 'package:breaking_bad_app/controller/actor_controller.dart';
import 'package:breaking_bad_app/presentation/ActorScreen/view/actor_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Список актеров Breaking Bad'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final actorController = Get.put(ActorController());
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Obx(() {
        if (actorController.loaded.isTrue) {
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black,
              height: 0,
            ),
            itemCount: 20,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () => Get.to(
                  ActorImageScreen(
                    id: actorController.actorList[index].charId,
                  ),
                ),
                leading: Image.network(
                    '${actorController.actorList[index].img}',
                    fit: BoxFit.fill),
                title: Text('${actorController.actorList[index].name}'),
                subtitle: Text(
                    'Дата рождения ${actorController.actorList[index].birthday}\n'
                    '${actorController.actorList[index].nickname}'),
                trailing: const Icon(Icons.keyboard_arrow_right, size: 40),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
