import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

DateTime now = DateTime.now().add(const Duration(days: 0));

int monthNumber = now.month.toInt();

int todayDate = now.day;

String monthName = DateFormat("MMMM", 'en_US').format(now);

double responsiveTextSize = 78;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double titleFontSize = 26;
    double bodyFontSize = 20;

    int menuButtonAlpha = 255;
    int titleTextAlpha = 255;

    BorderRadius slidingUpPanelRadius = BorderRadius.circular(25);

    List<Widget> taskContainers = [
      Container(
        margin: EdgeInsets.fromLTRB(
            screenWidth * 0.05, screenWidth * 0.05, screenWidth * 0.05, 0),
        width: screenWidth * 0.9,
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
            color: const Color(0xffF6F6FF),
            borderRadius: slidingUpPanelRadius,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(2, 2), blurRadius: 2),
            ]),
        child: Material(
          borderRadius: slidingUpPanelRadius,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: slidingUpPanelRadius,
            onTap: () {},
            child: const Center(
              child: Stack(
                alignment: AlignmentGeometry.xy(0, 0),
                children: [
                  Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                    size: 35,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ];

    void addTask () {
      setState(() {
        taskContainers.add(
          Container(
            margin: EdgeInsets.fromLTRB(
                screenWidth * 0.05, screenWidth * 0.05, screenWidth * 0.05, 0),
            width: screenWidth * 0.9,
            height: screenHeight * 0.15,
            decoration: BoxDecoration(
                color: const Color(0xffF6F6FF),
                borderRadius: slidingUpPanelRadius,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(2, 2), blurRadius: 2),
                ]),
            child: const Center(
                child: Row()
            ),
          ),
        );
      });
    }

    return Scaffold(
      body: SlidingUpPanel(
        onPanelSlide: (slidingIndex) {
          setState(() {
            responsiveTextSize =
                (titleFontSize * 3) * (1 / (1 + (slidingIndex * 0.3)));
            print(slidingIndex);
          });
        },
        onPanelClosed: () {
          setState(() {
            responsiveTextSize = (titleFontSize * 3);
            print("SlidingUpPanel is Closed");
          });
        },
        maxHeight: screenHeight * 0.7,
        minHeight: screenHeight * 0.16,
        borderRadius: slidingUpPanelRadius,
        body: Container(
          padding: EdgeInsets.fromLTRB(screenWidth * 0.05, screenWidth * 0.1,
              screenWidth * 0.05, screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              offset: const Offset(1, 1),
                              blurRadius: 3),
                        ]),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.01,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff9DB9EE)
                                      .withAlpha(menuButtonAlpha)),
                              margin:
                                  EdgeInsets.only(bottom: screenWidth * 0.012),
                            ),
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.01,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff9DB9EE)
                                      .withAlpha(menuButtonAlpha)),
                              margin:
                                  EdgeInsets.only(bottom: screenWidth * 0.012),
                            ),
                            Container(
                              width: screenWidth * 0.09,
                              height: screenWidth * 0.01,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xff9DB9EE)
                                      .withAlpha(menuButtonAlpha)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Text(
                    "responsiveTextSize is:${responsiveTextSize.toInt()}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "HI,",
                        style: TextStyle(
                          color: Colors.black.withAlpha(titleTextAlpha),
                          fontSize: responsiveTextSize,
                          fontWeight: FontWeight.w200,
                          shadows: [
                            Shadow(
                                color: Colors.grey.shade400,
                                offset: const Offset(4, 4),
                                blurRadius: 3),
                          ],
                        ),
                      ),
                      Text(
                        "MINU",
                        style: TextStyle(
                          color: Colors.black.withAlpha(titleTextAlpha),
                          fontSize: responsiveTextSize,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(
                                color: Colors.grey.shade400,
                                offset: const Offset(4, 4),
                                blurRadius: 3),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Left 3 tasks",
                    style: TextStyle(
                      fontSize: responsiveTextSize * 0.4,
                      fontWeight: FontWeight.w200,
                      shadows: [
                        Shadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(4, 4),
                            blurRadius: 3),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54, width: 4),
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(4, 8),
                            )
                          ],
                          image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/FB_IMG_1647807055811.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        panel: Container(
          decoration: BoxDecoration(
              color: const Color(0xffCDDCF9),
              borderRadius: slidingUpPanelRadius),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: screenWidth * 0.02),
                width: screenWidth * 0.4,
                height: screenWidth * 0.01,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(5)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(screenWidth * 0.05,
                    screenWidth * 0.03, screenWidth * 0.05, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$monthNumber",
                          style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Text(
                            monthName,
                            style: TextStyle(
                              fontSize: bodyFontSize,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                margin: EdgeInsets.fromLTRB(
                    screenWidth * 0.05, 0, screenWidth * 0.05, 0),
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.05,
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      decoration: BoxDecoration(
                          color: const Color(0xffF1F6FF),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2, 2),
                                blurRadius: 3),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenHeight * 0.05,
                            child: Center(
                              child: Text(
                                now
                                    .add(const Duration(days: -3))
                                    .day
                                    .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: titleFontSize,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenHeight * 0.05,
                            child: Center(
                              child: Text(
                                now
                                    .add(const Duration(days: -2))
                                    .day
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: titleFontSize),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenHeight * 0.05,
                            child: Center(
                              child: Text(
                                now
                                    .add(const Duration(days: -1))
                                    .day
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: titleFontSize),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenHeight * 0.07,
                            child: Center(
                              child: Text(
                                now.add(const Duration(days: 0)).day.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: titleFontSize),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenHeight * 0.05,
                            child: Center(
                              child: Text(
                                now.add(const Duration(days: 1)).day.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: titleFontSize),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenHeight * 0.05,
                            child: Center(
                              child: Text(
                                now.add(const Duration(days: 2)).day.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: titleFontSize),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenHeight * 0.05,
                            child: Center(
                              child: Text(
                                now.add(const Duration(days: 3)).day.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: titleFontSize),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    width: screenHeight * 0.07,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                        color: const Color(0xffFBFBFB),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(80),
                              offset: const Offset(3, 3),
                              blurRadius: 5),
                        ]),
                    child: Center(
                      child: Text(
                        todayDate.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: titleFontSize * 1.5),
                      ),
                    ),
                  ),
                ]),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                child: Row(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: taskContainers),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(screenWidth * 0.05,
                                screenWidth * 0.05, screenWidth * 0.05, 0),
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.15,
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6FF),
                                borderRadius: slidingUpPanelRadius,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 2),
                                      blurRadius: 2),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(screenWidth * 0.05,
                                screenWidth * 0.03, screenWidth * 0.05, 0),
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.15,
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6FF),
                                borderRadius: slidingUpPanelRadius,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 2),
                                      blurRadius: 2),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                screenWidth * 0.05,
                                screenWidth * 0.03,
                                screenWidth * 0.05,
                                screenWidth * 0.03),
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.15,
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6FF),
                                borderRadius: slidingUpPanelRadius,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 2),
                                      blurRadius: 2),
                                ]),
                          ),
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(screenWidth * 0.05,
                                screenWidth * 0.05, screenWidth * 0.05, 0),
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.15,
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6FF),
                                borderRadius: slidingUpPanelRadius,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 2),
                                      blurRadius: 2),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(screenWidth * 0.05,
                                screenWidth * 0.03, screenWidth * 0.05, 0),
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.15,
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6FF),
                                borderRadius: slidingUpPanelRadius,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 2),
                                      blurRadius: 2),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                screenWidth * 0.05,
                                screenWidth * 0.03,
                                screenWidth * 0.05,
                                screenWidth * 0.03),
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.15,
                            decoration: BoxDecoration(
                                color: const Color(0xffF6F6FF),
                                borderRadius: slidingUpPanelRadius,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(2, 2),
                                      blurRadius: 2),
                                ]),
                          ),
                        ]),
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
