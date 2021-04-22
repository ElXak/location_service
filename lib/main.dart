import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_models/user_location.dart';
import 'services/location_service.dart';
import 'views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
        initialData: null,
        create: (context) => LocationService().locationStream,
        child: MaterialApp(
          title: 'Flutter Demo',
          home: HomeView(),
        ));
  }
}
