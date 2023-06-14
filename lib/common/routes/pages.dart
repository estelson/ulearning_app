import 'package:flutter/material.dart';

/// Unify BlocProvider, routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    required this.bloc,
  });
}
