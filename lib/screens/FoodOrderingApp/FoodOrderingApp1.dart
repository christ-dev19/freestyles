import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math.dart' as vm;

import '../../core/AppRouting.dart';

Color colorOrange = const Color.fromRGBO(233, 130, 34, 1);
Color colorGrey = const Color.fromRGBO(216, 216, 236, 0.28627450980392155);

class FoodOrderingApp1 extends StatefulWidget {
  const FoodOrderingApp1({super.key});

  @override
  State<FoodOrderingApp1> createState() => _FoodOrderingApp1State();
}

class _FoodOrderingApp1State extends State<FoodOrderingApp1> {
  List<dynamic> foods = [
    {
      "id": Random().nextInt(99),
      'name': "All",
      "image": "assets/images/FoodOrderingApp/chicken.png"
    },
    {
      "id": Random().nextInt(99),
      'name': "Sea food",
      "image": "assets/images/FoodOrderingApp/chicken.png"
    },
    {
      "id": Random().nextInt(99),
      'name': "Sea food",
      "image": "assets/images/FoodOrderingApp/hamburger1.png"
    },
    {
      "id": Random().nextInt(99),
      'name': "Drink",
      "image": "assets/images/FoodOrderingApp/watermelon.png"
    },
    {
      "id": Random().nextInt(99),
      'name': "Sea food",
      "image": "assets/images/FoodOrderingApp/pizza.png"
    },
    {
      "id": Random().nextInt(99),
      'name': "Drink",
      "image": "assets/images/FoodOrderingApp/watermelon.png"
    },
    {
      "id": Random().nextInt(99),
      'name': "Sea food",
      "image": "assets/images/FoodOrderingApp/chicken.png"
    },
    {
      "id": Random().nextInt(99),
      'name': "Sea food",
      "image": "assets/images/FoodOrderingApp/pizza.png"
    },
  ];
  List<dynamic> itemPopulars = List.generate(
      4, (index) => {"image": "assets/images/FoodOrderingApp/hamburger1.png"});
  List<dynamic> itemPizza = List.generate(
      4, (index) => {"image": "assets/images/FoodOrderingApp/pizza.png"});

  int foodsIndexSelected = 0;
  int itemPopularIndexSelected = 0;

  TextEditingController _searchController = TextEditingController();

  final PageController _pageController =
      PageController(viewportFraction: .9, initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController(text: "Search");
    super.initState();
  }

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                CupertinoIcons.search,
                                size: 25,
                                color: Colors.black12,
                              ),
                              Expanded(
                                child: EditableText(
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  backgroundCursorColor: Colors.black12,
                                  controller: _searchController,
                                  cursorColor: Colors.black12,
                                  style: const TextStyle(
                                    color: Colors.black12,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  focusNode: FocusNode(),
                                ),
                              ),
                              Transform.rotate(
                                angle: vm.radians(90),
                                child: Container(
                                  height: 1,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    color: Colors.black12,
                                  ),
                                ),
                              ),
                              const Icon(
                                CupertinoIcons.placemark,
                                size: 25,
                                color: Colors.black12,
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    debugPrint("GestureDetector");
                                  },
                                  child: const Text(
                                    'New York, NYC',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black12,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: colorOrange,
                        radius: 20,
                        child: const Icon(
                          CupertinoIcons.slider_horizontal_3,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    minHeight: size.height / 9,
                    maxHeight: size.height / 7.1,
                    minWidth: size.width,
                  ),
                  child: ListView.separated(
                    itemCount: foods.length,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    separatorBuilder: (context, index) => SizedBox(
                      width: index == foods.length ? 0 : 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      dynamic food = foods[index];
                      return GestureDetector(
                        onTap: () {
                          foodsIndexSelected = index;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: index == foodsIndexSelected
                                  ? Colors.black
                                  : colorGrey,
                              radius: 30,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  '${food['image']}',
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                  repeat: ImageRepeat.noRepeat,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "${food['name']}",
                                style: TextStyle(
                                  color: index == foodsIndexSelected
                                      ? Colors.black
                                      : Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width,
                  child: const Text(
                    'Popular items',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width,
                  constraints: BoxConstraints(
                    minHeight: size.height / 3.5,
                    maxHeight: size.height / 2.5,
                  ),
                  child: PageView.builder(
                    itemCount: itemPopulars.length,
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemBuilder: (ctx, index) {
                      dynamic item = itemPopulars[index];
                      return ItemWidget(
                        title: 'Cheese Hot\nHambuger',
                        data: item,
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Delicious items',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(colorOrange),
                        ),
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: size.width,
                  constraints: BoxConstraints(
                    minHeight: size.height / 3.5,
                    maxHeight: size.height / 2.5,
                  ),
                  child: PageView.builder(
                    itemCount: itemPizza.length,
                    scrollDirection: Axis.vertical,
                    controller: _pageController,
                    itemBuilder: (ctx, index) {
                      dynamic item = itemPizza[index];
                      return ItemWidget(
                          title: 'Italian Hot\nPizza', data: item);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.home,
                color: Colors.black,
              ),
              const Icon(
                Icons.chat_bubble_outline,
                color: Colors.black,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 7),
                      color: Color.fromRGBO(209, 209, 209, 1),
                      blurRadius: 5,
                      spreadRadius: 4,
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: colorOrange,
                        radius: 9.5,
                        child: const Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          CupertinoIcons.cart_fill,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.notifications_none_rounded,
                color: Colors.black,
              ),
              const Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  dynamic data;
  String title;

  ItemWidget({super.key, required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'en_US');

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouting.foodOrderingApp2);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(data['image']),
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
            colorFilter:
                const ColorFilter.mode(Colors.black38, BlendMode.srcATop),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0).copyWith(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                    letterSpacing: 1.1),
              ),
              const Expanded(child: SizedBox()),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  numberFormat.format(8.99),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 7),
                    Text(
                      '5.0 (3.8k)',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(size.width),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white30,
                      child: Icon(Icons.messenger_outline_rounded,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white30,
                      child: Icon(CupertinoIcons.heart, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
