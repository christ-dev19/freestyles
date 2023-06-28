
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freestyles/core/AppRouting.dart';
import 'package:freestyles/core/constants.dart';
import 'package:freestyles/core/shared/CustomPainters.dart';
import 'package:intl/intl.dart';

Color colorOrange = const Color.fromRGBO(233, 130, 34, 1);
Color colorGrey = const Color.fromRGBO(216, 216, 236, 0.28627450980392155);

class FoodOrderingApp3 extends StatefulWidget {
  const FoodOrderingApp3({super.key});

  @override
  State<FoodOrderingApp3> createState() => _FoodOrderingApp3State();
}

class _FoodOrderingApp3State extends State<FoodOrderingApp3> {
  List<dynamic> foods = [
    {
      "id": DateTime.now().microsecond,
      "name": "Cheese Hot Hambuger",
      "quantity": 1,
      "price": 5.40,
      "image": "assets/images/FoodOrderingApp/hamburger1.png"
    },
    {
      "id": DateTime.now().microsecond,
      "name": "Italian Hot Pizza",
      "quantity": 2,
      "price": 16.20,
      "image": "assets/images/FoodOrderingApp/pizza-a-Aix-en-Province-img.jpg"
    },
  ];
  NumberFormat numberFormat = NumberFormat.simpleCurrency();

  double subTotal = 0.0;
  double taxes = 0.18;
  double totalDeliveryFree = 5.0;

  double totalPrice = 0.0;

  @override
  void initState() {
    // TODO: implement initState

    totalAmount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
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
                        const Expanded(
                          child: Text(
                            'My Cart',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height / 2.4,
                    margin: const EdgeInsets.only(top: 20),
                    child: ListView.separated(
                      itemCount: foods.length,
                      separatorBuilder: (ctx, index) => SizedBox(
                        height: index == foods.length ? 0 : 20,
                      ),
                      itemBuilder: (ctx, index) {
                        return myCardItem(ctx, data: foods[index]);
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRouting.foodOrderingApp1);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add, color: colorOrange, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          'Add more items',
                          style: TextStyle(
                            color: colorOrange,
                            fontFamily: Poppins,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Sub total",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            numberFormat.format(subTotal),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black45,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Taxes & Foo",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            numberFormat.format(taxes),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black45,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Delivery Fee",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            numberFormat.format(totalDeliveryFree),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black45,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomPaint(
                          painter: DividerPainter(
                              thickness: 2,
                              indent: 5,
                              color: Colors.black26.withOpacity(.03)),
                          size: Size(size.width, 30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Total",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            numberFormat.format(totalPrice),
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
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
              "Checkout",
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

  Widget myCardItem(BuildContext ctx, {required data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(ctx).size.width / 3,
          height: MediaQuery.of(ctx).size.width / 3,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(data['image']), fit: BoxFit.cover)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['name'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Text(
                numberFormat.format(data['price']),
                style: const TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      data['quantity']--;
                      totalAmount();
                      setState(() {});
                    },
                    child: const Icon(
                      CupertinoIcons.minus_circle,
                      color: Colors.black12,
                      size: 20,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "${data['quantity']}x",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      data['quantity']++;
                      totalAmount();
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.black12,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, size: 16),
                        onPressed: () {
                          foods.remove(data);
                          totalAmount();
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void totalAmount() {
    subTotal = foods
        .map((e) => e['price'] * e['quantity'])
        .reduce((previous, next) => previous + next);
    totalPrice = (subTotal * taxes) + subTotal + totalDeliveryFree;
  }
}
