import 'package:dartz/dartz.dart';
import 'package:travel_app/core.error/failures.dart';
import 'package:travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repository.dart';

import '../models/trip_model.dart';

class TripRepositoryImp implements TripRepository{
  final TripLocalDataSource localDataSource;

  

  TripRepositoryImp(this.localDataSource);

  @override
  Future<void> addTrips(Trip trip) async {
  final tripModel=TripModel.fromEntities(trip);
  localDataSource.AddTrips(tripModel);
  
  }

  @override
  Future<void> deleteTrips(int index)async {
 
    localDataSource.DeleteTrip( index);
  }

  @override
  Future<Either<Failure,List<Trip>>> getTrips() async {
    try {
       final tripmodels=localDataSource.getTrips();
       List<Trip> res=tripmodels.map((model) => model.toEntitiy()).toList();
         return Right(res);
    }catch(err){
      return Left(SomeSpecificError(err.toString()));
    }

  }



}