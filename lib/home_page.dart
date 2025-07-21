import 'package:flutter/material.dart';
import 'package:practical_break/widgets/custom_container.dart';
import 'package:practical_break/widgets/custom_text.dart';
import 'package:practical_break/widgets/product_details.dart';
import 'package:practical_break/widgets/richText.dart';
import 'package:rate/rate.dart';

import 'constants/font_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavorite = false;
  int counter = 0;
  double rateText =4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1d1d),
      appBar: AppBar(
        backgroundColor: Color(0XFF1d1d1d),
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Color(0xffff0000) : Colors.white,
            ),
          ),
          SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetails(),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'ManCity New Collection',
                    color: Colors.white,
                  ),
                  CustomText(text: '25/26 Away by Puma', color: Colors.grey),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Rate(
                            iconSize: 32,
                            color: Color(0xffff0000),
                            allowHalf: true,
                            allowClear: true,
                            initialValue: 4.0,
                            onChange: (double rate){
                              setState(() {
                                rateText = rate;
                              });

                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              '$rateText',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: primaryFont,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Color(0xFF363636),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomContainer(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (counter > 0) {
                                    counter--;
                                  }
                                });
                              },
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "$counter",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: primaryFont,
                                  ),
                                ),
                              ),
                            ),
                            CustomContainer(
                              onPressed: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: primaryFont,
                              fontSize: 20,
                            ),
                          ),

                          CustomRichtext(
                            firstText: "material",
                            secondText: 'Polyester',
                          ),
                          CustomRichtext(
                            firstText: "Shipping",
                            secondText: 'In 5 to 6 Days',
                          ),
                          CustomRichtext(
                            firstText: "Returns",
                            secondText: 'Within 20 Days',
                          ),
                        ],
                      ),
                      Container(
                        height: 140,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffff0000),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "\$89",
                              style: TextStyle(
                                fontFamily: primaryFont,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
