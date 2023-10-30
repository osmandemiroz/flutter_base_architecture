import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/features/home/view/mixin/home_view_mixin.dart';

part 'widget/home_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
