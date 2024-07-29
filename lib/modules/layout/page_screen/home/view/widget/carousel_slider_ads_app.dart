import 'package:carousel_slider/carousel_slider.dart';
import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/modules/details_lesson/view/screen/details_lesson_screen.dart';
import 'package:educational_platform/modules/layout/page_screen/home/model/home_model.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/modules/details_lesson/view/screen/details_lesson_screen.dart';
import 'package:educational_platform/modules/layout/page_screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderAdsApp extends StatefulWidget {
  final List<Ad> ads;
  final double? height;

  const CarouselSliderAdsApp({Key? key, this.height, required this.ads})
      : super(key: key);

  @override
  _CarouselSliderAdsAppState createState() => _CarouselSliderAdsAppState();
}

class _CarouselSliderAdsAppState extends State<CarouselSliderAdsApp> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.ads.map((ad) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  child: Card(
                    elevation: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(ad.image.toString()),
                          fit: BoxFit.fill,
                        ),
                      ),

                    ),
                  ),
                );
              },
            );
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: widget.height ?? 150.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        AnimatedSmoothIndicator(
          activeIndex: _current,
          count: widget.ads.length,
          effect: const WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Color(0xff055C9D),
            dotColor:Color(0xffD9D9D9),
          ),
        ),
      ],
    );
  }
}






class MyCarouselSlider extends StatelessWidget {
  final List<MyCourse> courses;
  final double? height;

  const MyCarouselSlider({Key? key, this.height, required this.courses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height ?? 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: courses.map((course) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                navigateTo(
                    context,
                    DetailsLessonScreen(
                      idDetails: course.id,
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: GridTile(
                    footer: GridTileBar(
                      backgroundColor: Colors.black87.withOpacity(0.85),
                      title: Text(course.nameCourse,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle:
                          Text('${course.nameLesson} - ${course.nameMaster}'),
                      trailing: Text(course.price,
                          style: TextStyle(
                              color: ColorManager.green,
                              fontWeight: FontWeight.bold)),
                    ),
                    child: FadeInImage(
                      image: NetworkImage(course.cover),
                      fit: BoxFit.cover,
                      placeholder:
                          const AssetImage('assets/images/placeholder.png'),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
