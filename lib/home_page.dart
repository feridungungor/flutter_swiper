import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutteryoutubedesings/constants.dart';
import 'package:flutteryoutubedesings/data.dart';
import 'package:flutteryoutubedesings/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  gradientStartColor,
                  gradientEndColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 44,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Color(0X7cdbf1ff),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                    onChanged: (value) {},
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/drop_down_icon.png'),
                    ),
                    underline: SizedBox(),
                  )
                ],
              ),
            ),
            Container(
              height: 500,
              padding: EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: planets.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                  activeSize: 20,
                  space: 8,
                )),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailPage(
                                    planetInfo: planets[index],
                                  )));
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Card(
                              elevation: 8,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 100),
                                    Text(
                                      planets[index].name,
                                      style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 44,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0Xff47455f)),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Solor System',
                                      style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 23,
                                          fontWeight: FontWeight.w500,
                                          color: primaryTextColor),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Know More',
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 18,
                                            color: secondaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: secondaryTextColor,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Hero(
                          tag: planets[index].position,
                          child: Image.asset(planets[index].iconImage),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: navigationColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(36))),
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/profile_icon.png'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
