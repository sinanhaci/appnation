import 'package:appnation/services/api_services/space_x_api_services/space_x_api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/space_x/space_x_latest_launch.dart';

void main() {
  runApp(const AppNation());
}

class AppNation extends StatelessWidget {
  const AppNation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppNation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => SpaceXApiServices(),
          ),
        ],
        child: const SpaceXLatestLaunch(),
      ),
    );
  }
}
