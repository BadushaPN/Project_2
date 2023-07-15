import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/location_screen.dart/widgets/use_current_location.dart';
import 'package:project2/view/whishlist_screen/whishlist_screen.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'package:project2/view/widgets/large_text.dart';

import 'widgets/add_location.dart';
import 'widgets/saved_location_text.dart';
import 'widgets/saved_locations.dart';

class LocationSelectionPage extends StatefulWidget {
  @override
  _LocationSelectionPageState createState() => _LocationSelectionPageState();
}

class _LocationSelectionPageState extends State<LocationSelectionPage> {
  final textEditingController = TextEditingController();
  // late MapController _mapController;
  LatLng _selectedLocation = LatLng(0, 0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: size.width / 7.8,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  controller: textEditingController,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: dark,
                      ),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    ),
                    hintText: 'Search for area,street name...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              UseCurrentLocation(size: size),
              AddLocation(size: size),
              SizedBox(
                height: size.width / 14,
              ),
              const SavedLocationText(),
              SavedLocations(size: size)
            ],
          ),
        ),
      ),
    );
  }
}
