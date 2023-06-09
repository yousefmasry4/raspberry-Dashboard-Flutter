import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_viewer_widget/map_viewer_widget.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';
import 'package:map_viewer_widget/src/compass_button_display.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart';
import 'package:vector_tile_renderer/vector_tile_renderer.dart' as vtr;

import 'osm_bright_ja_style.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() {
    return _MapViewState();
  }
}

class _MapViewState extends State<MapView> {
  final mapController = MapController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapViewerWidget(
          options: MapOptions(
            center: LatLng(39.640278, 141.946572),
            zoom: 17,
            maxZoom: 17,
            enableScrollWheel: false,
            enableMultiFingerGestureRace: false,
            adaptiveBoundaries: false,
            absorbPanEventsOnScrollables: false,
            debugMultiFingerGestureWinner: false,

          ),
          defaultNavigationStatus: NavigationStatus.northUp,
          navigationButtonVisible: false,
          compassButtonDisplay: CompassButtonDisplay.auto,
          mapController: mapController,
          // Specify the visible layer as children
          children: [
            VectorTileLayer(
              theme: _mapTheme(context),
              tileProviders: TileProviders(
                {'openmaptiles': _cachingTileProvider(_urlTemplate())},
              ),
            ),
          ],
        ),
        // When adding custom buttons
        // Positioned(
        //   right: 20,
        //   bottom: 120,
        //   child: Consumer(
        //     builder: (context, ref, child) {
        //       var text = 'none';
        //       final navigationStatus =
        //           ref.watch(mapViewerStateNotiferProvider).navigationStatus;
        //       switch (navigationStatus) {
        //         case NavigationStatus.headUp:
        //           text = 'headUp';
        //           break;
        //         case NavigationStatus.northUp:
        //           text = 'northUp';
        //           break;
        //         case NavigationStatus.none:
        //           text = 'none';
        //           break;
        //       }
        //       return FloatingActionButton(
        //         child: Text(
        //           text,
        //           style: const TextStyle(
        //             fontSize: 10,
        //           ),
        //         ),
        //         onPressed: () {
        //           ref
        //               .read(mapViewerStateNotiferProvider.notifier)
        //               .setNavigationStatus(
        //             navigationStatus: NavigationStatus.northUp,
        //             mapController: mapController,
        //           );
        //         },
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }

  vtr.Theme _mapTheme(BuildContext context) {
    // maps are rendered using themes
    // to provide a dark theme do something like this:
    // if (MediaQuery.of(context).platformBrightness == Brightness.dark)
    // return myDarkTheme();
    // return ProvidedThemes.lightTheme();
    return ThemeReader().read(osmBrightJaStyle());
    // return ThemeReader().read(lightThemeData());
  }

  VectorTileProvider _cachingTileProvider(String urlTemplate) {
    return MemoryCacheVectorTileProvider(
      delegate: NetworkVectorTileProvider(
        urlTemplate: urlTemplate,
        // this is the maximum zoom of the provider, not the
        // maximum of the map. vector tiles are rendered
        // to larger sizes to support higher zoom levels
        maximumZoom: 14,
      ),
      maxSizeBytes: 1024 * 1024 * 2,
    );
  }

  String _urlTemplate() {
    // Stadia Maps source https://docs.stadiamaps.com/vector/
    // return 'https://tiles.stadiamaps.com/data/openmaptiles/{z}/{x}/{y}.pbf?api_key=$apiKey';

    return 'https://tile.openstreetmap.jp/data/planet/{z}/{x}/{y}.pbf';

    // Mapbox source https://docs.mapbox.com/api/maps/vector-tiles/#example-request-retrieve-vector-tiles
    // return 'https://api.mapbox.com/v4/mapbox.mapbox-streets-v8/{z}/{x}/{y}.mvt?access_token=$apiKey',
  }
}