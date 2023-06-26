import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freestyles/core/AppRouting.dart';
import 'package:intl/intl.dart';

Color colorOrange = const Color.fromRGBO(233, 130, 34, 1);
Color colorGrey = const Color.fromRGBO(216, 216, 236, 0.28627450980392155);

class FoodOrderingApp2 extends StatefulWidget {
  const FoodOrderingApp2({super.key});

  @override
  State<FoodOrderingApp2> createState() => _FoodOrderingApp2State();
}

class _FoodOrderingApp2State extends State<FoodOrderingApp2> {
  List<dynamic> ingredients = [
    {
      "id": Random().nextInt(900),
      "portion": "50 gm",
      "name": "Mashroom",
      "quantity": 0,
      "price": 0.40,
      "checked": false,
      "image": "assets/images/FoodOrderingApp/beech-isolated-white.png",
    },
    {
      "id": Random().nextInt(900),
      "portion": "1/4 cup",
      "name": "Mayonnaise",
      "quantity": 2,
      "price": 0.20,
      "checked": true,
      "image": "assets/images/FoodOrderingApp/mayonnaise.png",
    },
    {
      "id": Random().nextInt(900),
      "portion": "1/2 cup",
      "name": "Peeled boilied egg",
      "quantity": 0,
      "price": 0.20,
      "checked": false,
      "image": "assets/images/FoodOrderingApp/iso-egg.png",
    },
    {
      "id": Random().nextInt(900),
      "portion": "1/3 cup",
      "name": "Lemon juce",
      "quantity": 1,
      "price": 0.20,
      "checked": true,
      "image": "assets/images/FoodOrderingApp/Lemon-Juice.png",
    },
    {
      "id": Random().nextInt(900),
      "portion": "50 gm",
      "name": "Mashroom",
      "quantity": 0,
      "price": 0.40,
      "checked": false,
      "image": "assets/images/FoodOrderingApp/beech-isolated-white.png",
    },
    {
      "id": Random().nextInt(900),
      "portion": "1/4 cup",
      "name": "Mayonnaise",
      "quantity": 2,
      "price": 0.20,
      "checked": true,
      "image": "assets/images/FoodOrderingApp/mayonnaise.png",
    },
    {
      "id": Random().nextInt(900),
      "portion": "1/2 cup",
      "name": "Peeled boilied egg",
      "quantity": 0,
      "price": 0.20,
      "checked": false,
      "image": "assets/images/FoodOrderingApp/iso-egg.png",
    },
  ];
  List<dynamic> ingredientsSelected = [];

  NumberFormat numberFormat = new NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRouting.foodOrderingApp1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black12,
                                width: 3,
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black12,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            CupertinoIcons.heart,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Italian hot Pizza",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          letterSpacing: 1.1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.amberAccent.shade100.withOpacity(.2),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/FoodOrderingApp/pizza.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: Text(
                            "Pizza Italian",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: Color.fromRGBO(232, 181, 63, 1),
                        ),
                        const SizedBox(width: 5),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: const TextSpan(
                            text: "4.8",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: " (2.2k review)",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height / 3.4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/images/FoodOrderingApp/pizza-a-Aix-en-Province-img.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          "Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              letterSpacing: 1.1),
                        ),
                      ),
                      Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "15 min",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text(
                      "11/2 cups (355 ml) warm water (105°F-115°F), 1 package (< 1/4 teaspoons active dry yeast, 3/4 cups (4909) bread flour,.",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Text(
                    "Add extra Ingredients",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        letterSpacing: 1.1),
                  ),
                  Container(
                    width: size.width,
                    height: size.height / 2,
                    margin: const EdgeInsets.only(top: 20),
                    child: ListView.separated(
                      itemCount: ingredients.length,
                      separatorBuilder: (ctx, index) => SizedBox(
                        height: index == ingredients.length ? 0 : 20,
                      ),
                      itemBuilder: (ctx, index) {
                        return IngredientItem(ctx, data: ingredients[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          isExtended: true,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.width)),
          label: SizedBox(
            width: size.width / 1.2,
            child: const Text(
              "Add to Cart",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget IngredientItem(BuildContext ctx, {required data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  color: colorGrey,
                ),
                child: Image.asset(
                  data['image'],
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data['name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: RichText(
                      text: TextSpan(
                        text: "${data['portion']} ",
                        style: const TextStyle(
                            color: Colors.black26,
                            fontSize: 13,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: "  +${numberFormat.format(data['price'])}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: data['checked'] ?? false,
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    data['quantity']--;
                    setState(() {});
                  },
                  child: const Icon(
                    CupertinoIcons.minus_circle,
                    color: Colors.black12,
                    size: 20,
                  ),
                ),
                Text(
                  "${data['quantity']}x",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    data['quantity']++;
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.black12,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        Checkbox(
          value: data['checked'],
          tristate: false,
          onChanged: (val) {
            data['checked'] = val;
            data['quantity'] = 1;

            setState(() {});
          },
          activeColor: colorOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
