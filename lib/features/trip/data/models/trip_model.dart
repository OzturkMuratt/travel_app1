
import 'package:hive/hive.dart';

import '../../domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel{
  @HiveField(0)
  final String title;
    @HiveField(1)
  final List<String> photos;
    @HiveField(2)
  final String decription;
    @HiveField(3)
  final DateTime date;
    @HiveField(4)
  final String location;

  TripModel({required this.title, required this.photos, required this.decription, required this.date, required this.location});

//Conversation from Entity to Model
  factory TripModel.fromEntities(Trip trip)=>TripModel(
    title: trip.title, 
    photos: trip. photos,
     decription:  trip.decription, 
     date: trip. date, 
     location:  trip.location
     );

//Conversation from Model to Entity

Trip toEntitiy() =>Trip(
  title: title, 
  photos: photos,
   decription: decription, 
   date: date, 
   location: location
   );

}