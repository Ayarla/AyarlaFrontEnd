import 'package:ayarla/services/service_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

class FlutterMapCoiffure extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
    child: Container(
    height: 300,
    child:FlutterMap(
      options: MapOptions(
        center: Provider.of<ManagementService>(context, listen: false).currentPosition
      ,
        zoom: 15.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
          "https://api.mapbox.com/styles/v1/nilsuoz/ckncausp71d9z17r1wpcxss8p/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoibmlsc3VveiIsImEiOiJja25jOHhiNWoxNTdnMnhsY2sxOGx4MnRsIn0.P8ZkwtMfptFGZE2y2KoEgw",
          additionalOptions: {
            'accessToken':
            'pk.eyJ1Ijoibmlsc3VveiIsImEiOiJja25jOHhiNWoxNTdnMnhsY2sxOGx4MnRsIn0.P8ZkwtMfptFGZE2y2KoEgw',
            'id': 'mapbox.streets',
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 50.0,
              height: 50.0,
              point: Provider.of<ManagementService>(context, listen: false).markerPosition,
              builder: (ctx) => Container(
                child: Icon(Icons.location_on_rounded,color: Colors.red,)
              ),
            )
          ],
        ),
      ],
    ),
    ),
    );
  }
}
