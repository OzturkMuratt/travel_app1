import 'package:hive/hive.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';
class TripLocalDataSource{

  final Box<TripModel> tripbox;

  TripLocalDataSource(this.tripbox);

List<TripModel> getTrips(){
return tripbox.values.toList();
  
}

void AddTrips(TripModel trip){
  tripbox.add(trip);
}

void DeleteTrip(int index){
  tripbox.deleteAt(index);
}

}