import 'package:flutter/material.dart';

import '../constants/font_const.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;
  List<String> images = [
    'assets/images/manCity1.webp',
    'assets/images/manCity2.webp',
    'assets/images/manCity6.webp',
  ];
  List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];
  int isSelectedInex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),

          height: 480,
          width: 300,
          child: Column(
            children: [
              SizedBox(
                height: 430,

                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.asset(images[index], fit: BoxFit.contain);
                  },
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(images.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: currentIndex == index ? 32 : 14,
                      height: 6,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? Color(0xffff0000)
                            : Colors.grey[800],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
            children: [
              ...List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelectedInex == index) {
                        isSelectedInex = -1;
                      } else {
                        isSelectedInex = index;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: isSelectedInex == index
                          ? Color(0xffff0000)
                          : Color(0XFF2b2b2b),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        sizes[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: primaryFont,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
