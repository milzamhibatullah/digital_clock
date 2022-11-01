import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/personalize.controller.dart';

class PersonalizeScreen extends GetView<PersonalizeController> {
  const PersonalizeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PersonalizeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PersonalizeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
