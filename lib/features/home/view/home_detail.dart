import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

///it returns boolean
@RoutePage<bool?>()

///sample home detail view
class HomeDetailView extends StatelessWidget {
  ///sample home detail view
  const HomeDetailView({required this.id, super.key});

  ///Home Detail View required string id value
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
      ),
    );
  }
}
