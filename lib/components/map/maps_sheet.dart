import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';

class MapsSheet {
  static show({
     BuildContext context,
     Function(AvailableMap map) onMapTap,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;
    print(availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    await availableMaps.first.showMarker(
      coords: Coords(37.759392, -122.5107336),
      title: "Ocean Beach",
    );

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        for (var map in availableMaps)
                          ListTile(
                            onTap: () => onMapTap(map),
                            title: Text(map.mapName),
                            leading: SvgPicture.asset(
                              map.icon,
                              height: 30.0,
                              width: 30.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}