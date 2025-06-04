import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/app/constant/hive_table_constant.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';

part 'course_hive_model.g.dart';

// This class represents a Course model stored in Hive.
@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel extends Equatable {
  @HiveField(0)
  final String? courseId;

  @HiveField(1)
  final String courseName;

  // Constructor to initialize CourseHiveModel.
  // If courseId is not provided, a new UUID is generated.
  CourseHiveModel({String? courseId, required this.courseName})
    : courseId = courseId ?? const Uuid().v4();

  // Initial constructor for creating an empty or default instance.
  const CourseHiveModel.initial() : courseId = '', courseName = '';

  // Factory constructor to convert a CourseEntity to a CourseHiveModel.
  factory CourseHiveModel.fromEntity(CourseEntity entity) {
    return CourseHiveModel(
      courseId: entity.courseId,
      courseName: entity.courseName,
    );
  }

  // Method to convert a CourseHiveModel back to a CourseEntity.
  CourseEntity toEntity() {
    return CourseEntity(courseName: courseName, courseId: courseId);
  }

  // Static method to convert a list of CourseEntity to a list of CourseHiveModel.
  static List<CourseHiveModel> fromEntityList(List<CourseEntity> entityList) {
    return entityList
        .map((entity) => CourseHiveModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [courseId, courseName];
}
