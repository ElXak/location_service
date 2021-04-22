import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data_models/user_location.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
      body: Center(
        child: Text(
            'Location: Lat: ${userLocation.longitude}, Long: ${userLocation.longitude}'),
      ),
    );
  }
}
