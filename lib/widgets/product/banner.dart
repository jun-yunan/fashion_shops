import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerProduct extends StatelessWidget {
  const BannerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/banners/banner-1.jpg',
      'assets/images/banners/banner-2.jpg',
      'assets/images/banners/banner-3.jpg',
      'assets/images/banners/banner-4.jpg',
    ];
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        height: 265,
      ),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
