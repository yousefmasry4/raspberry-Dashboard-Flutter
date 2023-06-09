import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  bool _showMenu = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 270.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            itemCount: menuItems.length ,
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0) {
                return _buildCarousel(context, index ~/ 2);
              } else {
                return Divider();
              }
            },
          ),
        ),
        const SizedBox(height: 15.0),

        /// black button with icon to show or hide the menue
        SizedBox(
          height: 20,
          width: 150,
          child: FloatingActionButton(
              elevation: 4,
              backgroundColor: Colors.black,
              onPressed: () {
                setState(() {
                  _showMenu = !_showMenu;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_showMenu ? "Hide" : "Show Menu",
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    _showMenu ? Icons.close : Icons.menu,
                    color: Colors.white,
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ///button to scroll up
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 270.0,
          child: Visibility(
            visible: _showMenu,
            child: PageView.builder(
              // store this controller in a State to save the carousel scroll position
              controller: PageController(viewportFraction: 0.8),
              scrollDirection: Axis.vertical,
              itemCount: menuItems.length ,
              itemBuilder: (BuildContext context, int itemIndex) {
                return _buildCarouselItem(context, carouselIndex, itemIndex);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Center(
        child:  ClipRect(
          child:  BackdropFilter(
            filter:  ImageFilter.blur(sigmaX: 6.0, sigmaY: 2.0),
            child:  Container(
              width: 200.0,
              height: 200.0,
              decoration:  BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.1)),
              child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/${menuItems[itemIndex]["icon"]}",
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      menuItems[itemIndex]["title"]!,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List menuItems = [
    {
      "title": "Navigation",
      "icon": "navigation-svgrepo-com.svg",
    },
    {
      "title": "Radio",
      "icon": "radio-tower-1-svgrepo-com.svg",
    },
    {
      "title": "Media",
      "icon": "music-1005-svgrepo-com.svg",
    },
    {
      "title": "My vehicle",
      "icon": "motorcycle-svgrepo-com.svg",
    },
  ];
}
