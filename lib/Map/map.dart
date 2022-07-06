import 'package:flutter/material.dart';
import 'package:r3grow/Map/current_location_screen.dart';
import 'package:r3grow/Map/search_places_screen.dart';
import 'package:r3grow/Map/simple_map_screen.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({Key? key}) : super(key: key);

  @override
  _MapPageWidgetState createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Google Maps"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const SimpleMapScreen();
              }));
            }, child: const Text("Simple Map")),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const CurrentLocationScreen();
              }));
            }, child: const Text("User current location")),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const SearchPlacesScreen();
              }));
            }, child: const Text("Search Places"))
          ],
        ),
      ),
    );
  }
}