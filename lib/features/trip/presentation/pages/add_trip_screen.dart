import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/domain/entities/trip.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

class AddTripScreen extends ConsumerWidget{
final _formkey=GlobalKey<FormState>();
final _titleController=TextEditingController(text: "Malatya");
final _descController=TextEditingController(text: "44 KAYISI");
final _locationController=TextEditingController(text: "Doğu anadoluda");
final _pictureController=TextEditingController(
text: "https://ideacdn.net/idea/dm/86/myassets/products/089/132.png?revision=1698683564");
List<String> pictures=[];

  AddTripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  return Form( 
    key: _formkey,
    child: Column(
      children:[
      TextFormField(
      controller: _titleController,
      decoration: const InputDecoration(labelText: 'Title'),
    ),
    TextFormField(
      controller: _descController,
      decoration: const InputDecoration(labelText: 'Description'),
    ),
    TextFormField
    (
      controller: _locationController,
      decoration: const InputDecoration(labelText: 'Location'),
    ),
    TextFormField
    (
      controller: _pictureController,
      decoration: const InputDecoration(labelText: 'Picture'),
    ),
    ElevatedButton(
      onPressed: (){
        pictures.add(_pictureController.text);
        if (_formkey.currentState!.validate()) {
          final newTrip= Trip(
            title: _titleController.text, 
            photos: pictures,
             decription: _descController.text,
              date: DateTime.now(), 
              location: _locationController.text);
              ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
              ref.watch(tripListNotifierProvider.notifier).loadTrip();
        }
      },
       child: const Text("Add Trip")
       )
    ]),

   );
  
  
   }



}