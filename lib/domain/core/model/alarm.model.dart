import 'package:Dclock/domain/core/model/days.model.dart';
import 'package:hive/hive.dart';

part 'alarm.model.g.dart';
@HiveType(typeId: 0)
class Alarm extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? time;
  @HiveField(2)
  bool? enabled;
  @HiveField(3)
  List<DayModel>? days;

  Alarm(
      {required this.name,
      required this.time,
      required this.enabled,
      required this.days});
}
