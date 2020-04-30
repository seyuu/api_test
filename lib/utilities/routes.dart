import 'package:api_test/screens/dashboard.dart';
import 'package:api_test/utilities/constants.dart';
import 'package:flutter/material.dart';

class Routes {
  //const u final olarak tanımlamak gerek ondan ekledim 
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_DASHBOARD: (BuildContext context) => Dashboard()
  };
}