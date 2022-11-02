import 'package:Dclock/domain/core/model/alarm.model.dart';
import 'package:Dclock/domain/core/model/days.model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  await Hive.initFlutter();
  Hive.registerAdapter(DayModelAdapter());
  Hive.registerAdapter(AlarmAdapter());
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
