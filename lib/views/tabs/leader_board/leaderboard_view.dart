import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sran/core/utils/color_constant.dart';
import 'package:sran/core/utils/math_utils.dart';

import '../../../controllers/leaderboard_controller.dart';
import '../../../core/widgets/custom_toolbar.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: kScaffoldBackgroundColor,
        ),
        leaderBoardAppBar(),
        Positioned(
          top: getVerticalSize(110),
          left: getHorizontalSize(55),
          child: Container(
            color: Colors.transparent,
            height: getVerticalSize(175),
            width: getHorizontalSize(264),
            child: Stack(children: [
              Positioned(
                bottom: getVerticalSize(0),
                left: getHorizontalSize(13),
                child: buildPosition23(),
              ),
              Positioned(
                bottom: getVerticalSize(20),
                left: getHorizontalSize(81),
                child: buildPosition1(),
              ),
              Positioned(
                bottom: getVerticalSize(0),
                right: getHorizontalSize(13),
                child: buildPosition23(),
              ),
            ]),
          ),
        ),
        Positioned(
          top: getVerticalSize(305),
          left: getHorizontalSize(24),
          child: Container(
            height: getVerticalSize(450),
            width: getHorizontalSize(327),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Material(
                        elevation: 5,
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            height: getVerticalSize(40),
                            width: getVerticalSize(40),
                            child: Text('1', style: TextStyle(
                              color: Colors.white,
                              fontSize: 14, fontWeight: FontWeight.w600,
                            ),),
                          ),
                          title: Text('Naveed Khan', style :TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w500,
                          )),
                          subtitle: Text('naveed@gmail.com',style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),),
                          trailing: Text('6 hours', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(05),),
                      Material(
                        elevation: 5,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            height: getVerticalSize(40),
                            width: getVerticalSize(40),
                            child: Text('1', style: TextStyle(
                              color: Colors.white,
                              fontSize: 14, fontWeight: FontWeight.w600,
                            ),),
                          ),
                          title: Text('Naveed Khan', style :TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w500,
                          )),
                          subtitle: Text('naveed@gmail.com',style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),),
                          trailing: Text('6 hours', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(05),),
                      Material(
                        elevation: 5,
                        color: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            height: getVerticalSize(40),
                            width: getVerticalSize(40),
                            child: Text('1', style: TextStyle(
                              color: Colors.white,
                              fontSize: 14, fontWeight: FontWeight.w600,
                            ),),
                          ),
                          title: Text('Naveed Khan', style :TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w500,
                          )),
                          subtitle: Text('naveed@gmail.com',style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),),
                          trailing: Text('6 hours', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(05),),
                      Material(
                        elevation: 5,
                        color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            height: getVerticalSize(40),
                            width: getVerticalSize(40),
                            child: Text('1', style: TextStyle(
                              color: Colors.white,
                              fontSize: 14, fontWeight: FontWeight.w600,
                            ),),
                          ),
                          title: Text('Naveed Khan', style :TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w500,
                          )),
                          subtitle: Text('naveed@gmail.com',style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),),
                          trailing: Text('6 hours', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(05),),
                      Material(
                        elevation: 5,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            height: getVerticalSize(40),
                            width: getVerticalSize(40),
                            child: Text('1', style: TextStyle(
                              color: Colors.white,
                              fontSize: 14, fontWeight: FontWeight.w600,
                            ),),
                          ),
                          title: Text('Naveed Khan', style :TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w500,
                          )),
                          subtitle: Text('naveed@gmail.com',style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),),
                          trailing: Text('6 hours', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(05),),
                      Material(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            height: getVerticalSize(40),
                            width: getVerticalSize(40),
                            child: Text('1', style: TextStyle(
                              color: Colors.white,
                              fontSize: 14, fontWeight: FontWeight.w600,
                            ),),
                          ),
                          title: Text('Naveed Khan', style :TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w500,
                          )),
                          subtitle: Text('naveed@gmail.com',style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),),
                          trailing: Text('6 hours', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(05),),
                      Material(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Container(
                            alignment: Alignment.centerLeft,
                            height: getVerticalSize(40),
                            width: getVerticalSize(40),
                            child: Text('1', style: TextStyle(
                              color: Colors.white,
                              fontSize: 14, fontWeight: FontWeight.w600,
                            ),),
                          ),
                          title: Text('Naveed Khan', style :TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w500,
                          )),
                          subtitle: Text('naveed@gmail.com',style: TextStyle(
                            color: Colors.white,
                            fontSize: 12, fontWeight: FontWeight.w400,
                          ),),
                          trailing: Text('6 hours', style: TextStyle(
                            color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w600,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Container buildPosition23() {
    return Container(
      height: getVerticalSize(82),
      width: getHorizontalSize(66),
      child: Stack(
        children: [
          Container(
            height: getVerticalSize(66),
            width: getVerticalSize(66),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Color(0xff3DC6FC),
              child: CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage(
                  'assets/images/user_profile.png',
                ),
              ),
            ),
          ),
          Positioned(
            left: getHorizontalSize(20),
            bottom: getVerticalSize(10),
            child: Container(
              height: getVerticalSize(27),
              width: getHorizontalSize(27),
              child: const CircleAvatar(
                  backgroundColor: Color(0xff3DC6FC),
                  child: Text(
                    '2',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Container buildPosition1() {
    return Container(
      height: getVerticalSize(153),
      width: getHorizontalSize(102),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            'assets/icons/crown-jewel-icon.svg',
            width: getVerticalSize(40),
            height: getVerticalSize(40),
          ),
          Stack(
            children: [
              Container(
                height: getVerticalSize(113),
                width: getVerticalSize(102),
                child: CircleAvatar(
                  radius: 51,
                  backgroundColor: Color(0xffFFBC1D),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(
                      'assets/images/user_profile.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                left: getHorizontalSize(37),
                bottom: getVerticalSize(0),
                child: Container(
                  height: getVerticalSize(27),
                  width: getHorizontalSize(27),
                  child: const CircleAvatar(
                      backgroundColor: Color(0xffFFBC1D),
                      child: Text(
                        '2',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Positioned leaderBoardAppBar() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        toolbarHeight: 106,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SizedBox(width: 40, height: 0)
            Image.asset(
              alignment: Alignment.centerLeft,
              "assets/images/sran_logo.png",
              color: kWhiteColor,
              height: getVerticalSize(50),
              width: getVerticalSize(93),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.centerRight,
                height: getVerticalSize(50),
                width: getVerticalSize(93),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/user_profile.png',
                  ),
                ),
              ),
            ),
          ],
        ),
        flexibleSpace: const Image(
          image: AssetImage(
            "assets/images/leaderBoard_appbar_bg.png",
          ),
          fit: BoxFit.cover,
        ),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.grey.shade100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
