
import 'package:hive/hive.dart';

part 'days.model.g.dart';
@HiveType(typeId: 1)
class DayModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  bool selected;
  DayModel({required this.name,required this.selected});
}