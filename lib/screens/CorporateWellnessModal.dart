import 'package:flutter/material.dart';

Color bottomSheetColor = const Color.fromRGBO(45, 43, 78, 1);

class CorporateWellnessModal extends StatefulWidget {
  const CorporateWellnessModal({Key? key}) : super(key: key);

  @override
  State<CorporateWellnessModal> createState() => _CorporateWellnessModalState();
}

class _CorporateWellnessModalState extends State<CorporateWellnessModal> {
  Color scaffoldColor = const Color.fromRGBO(252, 251, 254, 1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const overlayColorModal = Color.fromRGBO(157, 156, 163, .3);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: size.width,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(
          bottom: size.height / 12,
          top: size.height / 3.5,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: ShapeDecoration(
                  color: overlayColorModal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: bottomSheetColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/images/i01.png"),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Oh, you need \nsome rest !',
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: bottomSheetColor,
                  fontWeight: FontWeight.w900,
                  fontSize: size.aspectRatio * 50,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: Text(
                "Coffee machine can make a cappuccino especially for vou in 5 minutes Do vou want some coffee ?",
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: bottomSheetColor.withOpacity(.5),
                  fontWeight: FontWeight.w700,
                  fontSize: size.aspectRatio * 30,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);

                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: bottomSheetColor,
                          width: 3,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Text('No, latter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: bottomSheetColor,
                            fontWeight: FontWeight.w900,
                            fontSize: size.aspectRatio * 25,
                          )),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 212, 101, 1),
                        borderRadius: BorderRadius.circular(15),
                        shape: BoxShape.rectangle,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 4,
                            offset: Offset(5, 5),
                            color: Color.fromRGBO(255, 212, 101, .3),
                          )
                        ],
                      ),
                      child: Text(
                        'Yes, thanks!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color.fromRGBO(169, 128, 42, 1),
                          fontWeight: FontWeight.w900,
                          fontSize: size.aspectRatio * 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
