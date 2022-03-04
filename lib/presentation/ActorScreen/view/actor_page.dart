import 'package:flutter/material.dart';

class ActorImageScreen extends StatelessWidget {
  const ActorImageScreen({Key? key, @required this.name, @required this.image})
      : super(key: key);

  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(name!),
            centerTitle: true,
          ),
          body: Image.network(image!),
        );
  }
}
