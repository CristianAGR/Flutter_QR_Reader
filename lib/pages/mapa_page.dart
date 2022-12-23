
 import 'dart:async';

 import 'package:flutter/material.dart';
 import 'package:google_maps_flutter/google_maps_flutter.dart';

 import '../models/scan_model.dart';

 class MapaPage extends StatelessWidget {
      MapaPage({Key? key}) : super(key: key);
  
   final Completer<GoogleMapController> _controller = Completer();

   @override
   Widget build(BuildContext context) {

     final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

     final CameraPosition puntoInicial = CameraPosition(
     target: scan.getLatLng(),
     zoom: 17,
     tilt: 50
      );

      // Marcadores
      Set<Marker> markers = <Marker>{};
      markers.add(Marker(
        markerId: const MarkerId('geo-location'),
        position: scan.getLatLng()
        ));

     return Scaffold(
       appBar: AppBar(
         title: const Text('Mapa'),
       ),
       body: GoogleMap(
        myLocationButtonEnabled: false,
         mapType: MapType.normal,
         markers: markers,
         initialCameraPosition: puntoInicial,
         onMapCreated: (GoogleMapController controller) {
           _controller.complete(controller);
         },
       ),
     );
   }
 }