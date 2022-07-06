import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPageWidget extends StatefulWidget {
  const MapPageWidget({Key? key}) : super(key: key);

  @override
  _MapPageWidgetState createState() => _MapPageWidgetState();
}

class _MapPageWidgetState extends State<MapPageWidget> {
  late GoogleMapController googleMapController;

  // make sure it's Singapore Map
  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(1.3437459,103.8240449), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MAP"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        // + /- button
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      //////////////////////////////////////////////////// BUTTON FOR CURRENT LOCATION ////////////////////////////////////////////////////
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // position is returned here if it's not denied
          Position position = await _determinePosition();

          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


          markers.clear();

          markers.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude)));

          setState(() {});

        },
        // button style
        label: const Text("Current Location"),
        icon: const Icon(Icons.location_history), 
      ),
    );
  }
  ////////////////////////////////////////////////////  LOCATION SERVICE PERMISSION  ////////////////////////////////////////////////////
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    // GET USER CURRENT POSITION AND RETURN WHEN BUTTON IS CLICKED
    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}