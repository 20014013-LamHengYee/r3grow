import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

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

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  // for the icon later on
  late BitmapDescriptor mapMaker;

  // for the icon size
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // specify what data to take
  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    // icon size
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/recycle.png', 100);

    final Marker marker = Marker(
        markerId: markerId,
        position:
            LatLng(specify['coords'].latitude, specify['coords'].longitude),
        infoWindow:
            InfoWindow(title: specify['title'], snippet: specify['location']),
        icon: BitmapDescriptor.fromBytes(markerIcon));

    setState(() {
      markers[markerId] = marker;
    });
  }

  // get data from firebase
  getMarkerData() async {
    FirebaseFirestore.instance.collection('Map').get().then((myMockData) {
      if (myMockData.docs.isNotEmpty) {
        for (int i = 0; i < myMockData.docs.length; i++) {
          initMarker(
              myMockData.docs[i].data(), myMockData.docs[i].reference.id);
        }
      }
    });
  }

  @override
  void initState() {
    getMarkerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Set<Marker> getMarker() {
    //   return <Marker>{
    //     Marker(
    //         markerId: const MarkerId('yishun'),
    //         position: const LatLng(1.3437459, 103.8240449),
    //         infoWindow: const InfoWindow(
    //             title: 'Collection Type', snippet: 'Location, Postal'),
    //         icon: BitmapDescriptor.defaultMarkerWithHue(
    //           BitmapDescriptor.hueBlue,
    //         ))
    //   };
    // }

    return Scaffold(
        appBar: AppBar(
          title: const Text("MAP"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor:Colors.green,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: Set<Marker>.of(markers.values),
              // + /- button [I use custom one]
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
            //////////////////////////////////////////////////// BUTTON FOR CURRENT LOCATION ////////////////////////////////////////////////////
            // floatingActionButton: FloatingActionButton.extended(
            //   onPressed: () async {
            //     // position is returned here if it's not denied, call func _determinePosition
            //     Position position = await _determinePosition();

            //     // A constant that is true if the application was compiled in debug mode.
            //     if (kDebugMode) {
            //       print("POS: " + position.toString());
            //     }

            //     googleMapController.animateCamera(CameraUpdate.newCameraPosition(
            //         CameraPosition(
            //             target: LatLng(position.latitude, position.longitude),
            //             zoom: 14)));

            //     // Marker(
            //     //     markerId: const MarkerId('currentLocation'),
            //     //     position: LatLng(position.latitude, position.longitude),
            //     //     infoWindow: const InfoWindow(title: 'Current Location'),
            //     //     icon: BitmapDescriptor.defaultMarkerWithHue(
            //     //       BitmapDescriptor.hueRed,
            //     // ));

            //     // // if not the current location marker wont come out
            //     // setState(() {

            //     // });
            //   },
            //   // button style
            //   label: const Text("Current Location"),
            //   icon: const Icon(Icons.location_history),
            // ),
            //////////////////////////////////////////////////// BUTTON FOR ZOOM ////////////////////////////////////////////////////
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: const Color.fromARGB(255, 100, 179, 244), // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: const SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add),
                          ),
                          onTap: () {
                            googleMapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ClipOval(
                      child: Material(
                        color: const Color.fromARGB(255, 100, 179, 244), // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: const SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {
                            googleMapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //////////////////////////////////////////////////// BUTTON FOR CURRENT LOCATION ////////////////////////////////////////////////////
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.white70,// button color
                      child: InkWell(
                        splashColor: Colors.grey, // inkwell color
                        child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () async {
                          // position is returned here if it's not denied, call func _determinePosition
                          Position position = await _determinePosition();

                          // A constant that is true if the application was compiled in debug mode.
                          if (kDebugMode) {
                            print("POS: " + position.toString());
                          }

                          googleMapController.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(
                                      position.latitude, position.longitude),
                                  zoom: 14)));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
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
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    return position;
  }
}
