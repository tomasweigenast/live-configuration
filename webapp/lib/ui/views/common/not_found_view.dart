import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No hemos podido encontrar lo que estas buscando"),
    );
  }
}