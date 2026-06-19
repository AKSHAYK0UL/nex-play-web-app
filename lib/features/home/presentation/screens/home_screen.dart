import 'package:flutter/material.dart';
import 'package:nex_play/features/home/presentation/widgets/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: BuildCarouselSlider(),
      
    );
  }
}
