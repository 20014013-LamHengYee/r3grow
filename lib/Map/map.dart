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
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(1.3437459, 103.8240449), zoom: 14);

  List<Marker> markers = [];

  @override
  void initState() {
    intilize();
    super.initState();
  }

  // add multiple markers to represent the recycle bin near them
  intilize() {
    Marker firstM = Marker(
      markerId: const MarkerId('yishun'),
      position: const LatLng(1.3437459, 103.8240449),
      infoWindow: const InfoWindow(title: 'Yishun Natura'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ),
    );
    Marker secondM = Marker(
      markerId: const MarkerId('thomson plaza'),
      position: const LatLng(1.3548, 103.8308),
      infoWindow: const InfoWindow(title: 'Yishun Boyf'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ),
    );
    Marker thirdM = Marker(
      markerId: const MarkerId('yishun'),
      position: const LatLng(1.3637459, 103.8240449),
      infoWindow: const InfoWindow(title: 'ktph'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ),
    );
    Marker myHouse = Marker(
      markerId: const MarkerId('yishun'),
      position: const LatLng(1.4304, 103.8449),
      infoWindow: const InfoWindow(title: 'ktph'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ),
    );

    markers.add(firstM);
    markers.add(secondM);
    markers.add(thirdM);
    markers.add(myHouse);

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MAP"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers.map((e) => e).toSet(),
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

          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              // yishun natura: 1.4304, 103.8449
              // keep returning: 1.3303° N, 103.8913° 
              position: LatLng(position.latitude, position.longitude),
              infoWindow: const InfoWindow(title: 'Current Location'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRed,
              )));

          // if not the current location marker wont come out
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
    // get my location high accuracy
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    return position;
  }
}
