import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int? id;
  final String? title;
  final String? description;
  final List<dynamic>? image;
  final int? price;
  final num? discount;
  final num? ratings;
  const DetailsPage(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.ratings,
      required this.discount})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

int _currentPosition = 0;

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: widget.image!.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = widget.image![index];
                return Image.network(urlImage);
              },
              options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 2),
                  onPageChanged: (index, reason) =>
                      setState(() => _currentPosition = index))),
          Center(
            child: DotsIndicator(
              dotsCount: widget.image!.length,
              position: _currentPosition.toDouble(),
              decorator: DotsDecorator(
                  size: const Size(19, 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  activeSize: const Size(19, 5),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
            ),
          ),
          Text(widget.description ?? "", textAlign: TextAlign.justify),
          Text(widget.price.toString(), textAlign: TextAlign.left),
        ],
      )),
    );
  }
}
