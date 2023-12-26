import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/trip/presentation/pages/add_trip_screen.dart';
import 'package:travel_app/features/trip/presentation/providers/trip_provider.dart';

import 'my_trip_screen.dart';

class MainScreen extends ConsumerWidget{
    MainScreen({super.key});
  final PageController _pageController=PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  String profilPic="https://images.unsplash.com/photo-1618641986557-1ecd230959aa?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  
  @override
  Widget build(BuildContext context,WidgetRef ref){
    ref.watch(tripListNotifierProvider.notifier).loadTrip();

    _pageController.addListener((){
      _currentPage.value=_pageController.page!.round();

    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Selam",
          style: TextStyle( fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)
          ),
          Text("Bugün mü?",
          style: TextStyle( fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)
          ),  
        ]
        ),
        actions: [
          Padding(padding: const EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius:BorderRadius.circular(100.0),
            child: Image.network(
              profilPic,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
             ),
          )
          
          ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
        const  MyTripsScreen(),
          AddTripScreen(),
         const Text('3'),
        ],
        
      ),
      bottomNavigationBar: ValueListenableBuilder(
       valueListenable : _currentPage,
       builder:(context,pageIndex,child){
       return BottomNavigationBar(
        currentIndex: pageIndex,
          items: const [
             BottomNavigationBarItem(
            icon:Icon(Icons.list),
            label: "My Trips"
            ),    BottomNavigationBarItem(
            icon:Icon(Icons.add),
            label: "My Trips"
            ),    BottomNavigationBarItem(
            icon:Icon(Icons.map),
            label: "Maps"
            ),
          ],
         
          onTap:(index){
        
        _pageController.jumpToPage(index);
          },
        
        );
       }
      ),
    );
  }
}