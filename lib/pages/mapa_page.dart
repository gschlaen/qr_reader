import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qr_reader/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType maptype = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17,
      tilt: 50, //Inclinacion del mapa
    );

    //Marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
        appBar: AppBar(
          title: Text('Mapa'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.location_searching_outlined, color: Colors.white),
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: scan.getLatLng(),
                      zoom: 17,
                      tilt: 50,
                    ),
                  ),
                );
              },
            )
          ],
        ),
        body: GoogleMap(
          myLocationButtonEnabled: true,
          mapType: maptype,
          markers: markers,
          initialCameraPosition: puntoInicial,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.layers),
          onPressed: () {
            if (maptype == MapType.normal) {
              maptype = MapType.satellite;
            } else {
              maptype = MapType.normal;
            }

            setState(() {});
          },
        ));
  }
}
