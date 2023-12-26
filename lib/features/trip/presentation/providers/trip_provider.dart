import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';
import 'package:travel_app/features/trip/data/repositories/trip_repository_implemant.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/domain/repositories/trip_repository.dart';
import 'package:travel_app/features/trip/domain/usercases/add_trips.dart';
import 'package:travel_app/features/trip/domain/usercases/delete_trip.dart';
import 'package:travel_app/features/trip/domain/usercases/get_trips.dart';


final tripLocalDataSourceProvider=Provider<TripLocalDataSource>((ref){
final Box< TripModel>tripbox =Hive.box('trips');
return TripLocalDataSource(tripbox);
});


final tripRepositoryProvider=Provider<TripRepository>((ref){
final localDataSource=ref.read(tripLocalDataSourceProvider);
return TripRepositoryImp(localDataSource);
});


final addTripProvider=Provider<AddTrips>((ref){
final repository=ref.read(tripRepositoryProvider);
return AddTrips(repository);

});

final getTripsProvider=Provider<GetTrips>((ref){
final repository=ref.read(tripRepositoryProvider);
return GetTrips(repository);
});

final deleteTripsProvider=Provider<DeleteTrip>((ref){
final repository=ref.read(tripRepositoryProvider);
return DeleteTrip(repository);
});

final tripListNotifierProvider=StateNotifierProvider<TripListNotifier,List<Trip>>((ref)  {
  
final getTrips=ref.read(getTripsProvider);
final addTrips=ref.read(addTripProvider);
final deleteTrips=ref.read(deleteTripsProvider);
   
   return TripListNotifier(getTrips,addTrips,deleteTrips);
});

class TripListNotifier extends StateNotifier<List<Trip>>{
  final GetTrips _getTrips;
  final AddTrips _addTrips;
  final DeleteTrip _deleteTrip; 

  TripListNotifier(this._getTrips, this._addTrips, this._deleteTrip) :super([]);

 Future<void> addNewTrip(Trip trip) async{

    await _addTrips(trip);
  }

 Future<void> remoweTrip(int tripId)async{
    await _deleteTrip(tripId);
  }
 Future<void> loadTrip()async{
    final tripsOrFailure= await _getTrips();
    tripsOrFailure.fold((error) => state=[],(trips) =>state=trips  );
  }
}