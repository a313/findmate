import 'package:findmate/modules/bottomScreen/home/notification/notification_screen.dart';
import 'package:findmate/modules/bottomScreen/home/profileDetail/profile_detail_screen.dart';
import 'package:findmate/x_res/res.dart';
import 'package:findmate/x_utils/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    for (int i = 0; i < imageList.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: imageList[i]),
          likeAction: () {
            /*  _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));*/
          },
          nopeAction: () {
            /*_scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));*/
          },
          superlikeAction: () {
            /*_scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));*/
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  List<String> imageList = [
    ImageConst.gril1,
    ImageConst.gril2,
    ImageConst.gril1,
    ImageConst.gril2,
    ImageConst.gril1,
    ImageConst.gril2,
  ];

  final List<SwipeItem> _swipeItems = <SwipeItem>[];

  late MatchEngine _matchEngine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage(
              ImageConst.appLogo,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => NotificationScreen());
            },
            icon: Icon(
              Icons.notifications,
              color: ColorConst.appColorFF,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "YourApp",
          style: TextStyleClass.arizoniaRegular(
            size: 27.0,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              ///tinder swiper
              SizedBox(
                height: Get.height / 1.48 /*532*/,
                child: SwipeCards(
                  matchEngine: _matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => ProfileDetailHomeScreen());
                      },
                      child: Container(
                        width: Get.width,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, bottom: 45),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          image: DecorationImage(
                            image: AssetImage(
                              _swipeItems[index].content.text,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 34,
                              width: 71,
                              decoration: BoxDecoration(
                                color: ColorConst.black.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: ColorConst.white,
                                    size: 18,
                                  ),
                                  Text(
                                    "3 Miles",
                                    textAlign: TextAlign.center,
                                    style: TextStyleClass.interSemiBold(
                                      size: 12.0,
                                      color: ColorConst.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rex, 27",
                                    style: TextStyleClass.interBold(
                                      size: 30.0,
                                      color: ColorConst.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    "Lives in Vadodara",
                                    style: TextStyleClass.interSemiBold(
                                      size: 15.0,
                                      color: ColorConst.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  onStackFinished: () {},
                  itemChanged: (SwipeItem item, int index) {
                    print("item: ${item.content.text}, index: $index");
                  },
                  // upSwipeAllowed: true,
                  fillSpace: true,
                ),
              ),

              ///buttons row
              Positioned(
                bottom: -35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PostContain(
                      height: 42,
                      width: 42,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(ImageConst.restart),
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    PostContain(
                      height: 58,
                      width: 58,
                      child: Padding(
                        padding: const EdgeInsets.all(21.0),
                        child: SvgPicture.asset(ImageConst.cancel),
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    PostContain(
                      height: 78,
                      width: 78,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: SvgPicture.asset(ImageConst.heart),
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    PostContain(
                      height: 58,
                      width: 58,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SvgPicture.asset(ImageConst.star),
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    PostContain(
                      height: 42,
                      width: 42,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(ImageConst.light),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Content {
  final String text;

  Content({
    required this.text,
  });
}
