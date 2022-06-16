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
  final int? stock;
  const DetailsPage(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.ratings,
      required this.discount,
      required this.stock})
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          slider(),
          dotsIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(widget: widget),
                const SizedBox(height: 10),
                price(),
                const SizedBox(height: 10),
                _details(
                    widget: widget,
                    description: widget.ratings.toString(),
                    title: "Ratings: "),
                const SizedBox(height: 10),
                _details(
                    widget: widget,
                    description: " ${widget.discount.toString()} %",
                    title: "Discount Percent: "),
                const SizedBox(height: 10),
                _details(
                    widget: widget,
                    description: widget.stock.toString(),
                    title: "Stock: "),
                const SizedBox(height: 10),
                _details(
                  widget: widget,
                  title: "Description: ",
                  description: widget.description ?? "",
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Text price() {
    return Text("Price: \$ ${widget.price.toString()}",
        textAlign: TextAlign.left,
        style:
            const TextStyle(fontWeight: FontWeight.w700, color: Colors.indigo));
  }

  Center dotsIndicator() {
    return Center(
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
    );
  }

  CarouselSlider slider() {
    return CarouselSlider.builder(
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
                setState(() => _currentPosition = index)));
  }
}

class _title extends StatelessWidget {
  const _title({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title ?? "",
      textAlign: TextAlign.left,
      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    );
  }
}

class _details extends StatelessWidget {
  final String? title;
  final String? description;
  const _details(
      {Key? key,
      required this.widget,
      required this.description,
      required this.title})
      : super(key: key);

  final DetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title,
          style:
              const TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          children: [
            TextSpan(
                text: description,
                style: TextStyle(fontWeight: FontWeight.w400))
          ]),
    );
  }
}
