import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/data/data_source/local_datasource/batch_local_data_source.dart';
import 'package:student_management/features/batch/data/repository/batch_repository.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

class BatchLocalRepository implements IBatchRepository{

  final BatchLocalDataSource _batchLocalDataSource;

  BatchLocalRepository(
    {
      required BatchLocalDataSource batch_local_data_source
    }
  )
  :_batchLocalDataSource=batch_local_data_source;

  @override
  Future<Either<Failure, void>> createBatch(BatchEntity batch) {
    
    try{
      _batchLocalDataSource.createBatch(batch);
      return Future.value(Right(null));
    }
    catch(e){
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> deletBatch(String id) {
    try{
      _batchLocalDataSource.deletBatch(id);
      return Future.value(Right(null));
    }
    catch(e){
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getBatches() async {
    try{
      final batches = await _batchLocalDataSource.getBatches();
      return Right(batches);
    }
    catch(e){
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

}