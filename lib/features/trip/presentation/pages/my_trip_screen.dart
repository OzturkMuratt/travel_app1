import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';
import 'package:travel_app/features/trip/presentation/widgets/travel_card.dart';

import '../widgets/custom_search_bar.dart';

class MyTripsScreen extends ConsumerWidget{

  const MyTripsScreen({Key? ket}) : super(key: ket);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final tripList=ref.watch(tripListNotifierProvider);
    
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
        
          CustomSearchbar(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tripList.length,
            itemBuilder: (context, index){

              final trip=tripList[index];
              return TravelCard(
                imageUrl: trip.photos[0],
                 title: trip.title,
                  description: trip.decription, 
                  date: DateFormat.yMMMEd().format(trip.date).toString(), 
                  location: trip.location, 
                  onDelete:(){

                      ref.read(tripListNotifierProvider.notifier).remoweTrip(index);
                      ref.read(tripListNotifierProvider.notifier).loadTrip(); 
                },
                );
            },
          ),
      
      
      ]
      ),
    );
  }
}