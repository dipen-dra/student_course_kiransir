import 'package:student_management/core/network/hive_services.dart';
import 'package:student_management/features/batch/data/data_source/batch_data_source.dart';
import 'package:student_management/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

class BatchLocalDataSource implements IBatchDataSource{

  final HiveServices hiveServices;
  final BatchHiveModel batchHiveModel;

  BatchLocalDataSource(
    {
      required this.batchHiveModel,
      required this.hiveServices,
    }
  );

  @override
  Future<void> createBatch(BatchEntity batch) async {
    try{
      await hiveServices.addBatch(BatchHiveModel.fromEntity(batch));
    }
    catch(e){
      throw Exception('Failed to add a batch:$e');
    }
  }


  @override
  Future<void> deletBatch(String id) async{
    try{
      await hiveServices.deletBatch(id);
    }
    catch(e){
      throw Exception("Failed to delet a batch :$e");
    }

  }

  @override
  Future<List<BatchEntity>> getBatches() async {
    try{
      final batches=await hiveServices.getAllBatches();
      return BatchHiveModel.toEntityList(batches);
    }
    catch(e){
      throw Exception("Failed to get all batches :$e");
    }

  }
}