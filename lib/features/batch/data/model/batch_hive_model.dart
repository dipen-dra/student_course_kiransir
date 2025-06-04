import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/app/constant/hive_table_constant.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

part 'batch_hive_model.g.dart';
@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel extends Equatable {
  @HiveField(0)
  final String? batchId;

  @HiveField(1)
  final String batchName;

  BatchHiveModel({String? batchId, required this.batchName})
    : batchId = batchId ?? const Uuid().v4();

  //initial constructor
  const BatchHiveModel.initial() : batchId = '', batchName = '';

  //From Entity
  factory BatchHiveModel.fromEntity(BatchEntity entity) {
    return BatchHiveModel(batchId: entity.batchId, batchName: entity.batchName);
  }
  //to entity
  BatchEntity toEntity() { 
    return BatchEntity(batchName: batchName, batchId: batchId);
  }

  //to entity list
  static List<BatchHiveModel> fromEntityList(List<BatchEntity> entityList) {
    return entityList
        .map((entity) => BatchHiveModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [batchId, batchName];
}
