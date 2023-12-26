import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget{

final TextEditingController _controller=TextEditingController();

  CustomSearchbar({super.key});

@override
Widget build(BuildContext context){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0,3)
        )
      ]
    
    ),
    child: Row(
      children: [
      const Icon(Icons.search,color: Colors.grey),
      const SizedBox(width: 10,),
      Expanded(
        child: TextField(controller: _controller,
        decoration: const InputDecoration(
          hintText: "Search Destination...",
          border: InputBorder.none
        ),)
        )

    ]),
  );
}

}