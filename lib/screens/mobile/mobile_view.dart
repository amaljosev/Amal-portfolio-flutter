import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/core/constants/constants.dart';
import 'package:myportfolio/core/font/font_size.dart';
import 'package:myportfolio/core/styles/appstyles.dart';
import 'package:myportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:myportfolio/screens/tab/widgets/skills_widget.dart';
import 'package:myportfolio/screens/web/widgets/home_title_section_widget.dart';
import 'package:myportfolio/screens/widgets/about_image_widget.dart';
import 'package:myportfolio/screens/widgets/contact_me_widget.dart';
import 'package:myportfolio/screens/widgets/footer_widget.dart';
import 'package:myportfolio/screens/widgets/home_image_widget.dart';
import 'package:myportfolio/screens/widgets/my_drawer.dart';
import 'package:myportfolio/screens/common/my_elevated_button.dart';
import 'package:myportfolio/screens/widgets/portfolio_widget.dart';
import 'package:myportfolio/screens/widgets/services_widget.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeCtrl = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          MyElevationButton(
              title: 'Hire Me', onPressed: () => homeCtrl.openMail()),
          Appconstants.smallWidth
        ],
      ),
      drawer: MyDrawerWidget(
          controller: _scrollController,
          size: size,
          myPlatformHeight: homeCtrl.mobScrollHeights),
      body: ListView(
        controller: _scrollController,
        children: [
          HomeTitleSectionWidget(
            size: size,
            fontSize: 0.045,
            experienceWidth: 0.8,
            experienceHight: 0.2,
            mainWidth: 1,
            smallSpace: Appconstants.verySmallheight,
            verySmallSpace: Appconstants.tinyHeight,
            bigSpace: Appconstants.mediumheight,
            experienceFontSize: 0.03,
            myMainAxisAlignment: MainAxisAlignment.center,
            myCrossAxisAlignment: CrossAxisAlignment.center,
          ),
          HomeImageWidget(size: size),
          Appconstants.sHight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Services', style: Appstyles.headline(context, 0.07)),
            ],
          ),
          Appconstants.mediumheight,
          Column(
            children: List.generate(
              homeCtrl.myServices.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ServiesWidget(
                    isMobile: true,
                    size: size,
                    service: homeCtrl.myServices[index],
                    padding: 15,
                    titleFontSize: 0.035,
                    descriptionFontSize: 0.03,
                    iconSize: 0.2),
              ),
            ),
          ),
          Appconstants.sHight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('About Me', style: Appstyles.headline(context, 0.035)),
            ],
          ),
          Appconstants.largeheight,
          Column(
            children: [
              AboutMeImageWidget(size: size),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text(
                        "I am a highly motivated and self-taught Flutter developer with a passion for building visually appealing, user-friendly mobile applications. With a strong foundation in object-oriented programming, I’m skilled at creating clean, efficient code and thrive on quickly adapting to new technologies. I enjoy transforming ideas into functional, beautiful apps that prioritize user experience and seamless performance.",
                        style: Appstyles.content(
                            context: context,
                            fontSize: FontSize.mobcontentSize)),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: MyElevationButton(
                              title: 'Hire Me',
                              onPressed: () => homeCtrl.openMail()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Appconstants.sHight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My Skills', style: Appstyles.headline(context, 0.035)),
            ],
          ),
          Appconstants.largeheight,
          SizedBox(
            child: Wrap(
              runSpacing: 20,
              alignment: WrapAlignment.spaceEvenly,
              children: List.generate(
                  homeCtrl.skills.length,
                  (index) => TabSkillsWidget(
                      skill: homeCtrl.skills[index],
                      size: size,
                      fontSize: FontSize.mobcontentSize,
                      containerWidth: 0.3)),
            ),
          ),
          Appconstants.sHight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Portfolio', style: Appstyles.headline(context, 0.035)),
            ],
          ),
          PortfolioWidget(
            size: size,
            popupMainVerticalPadding: checkScreenSize(size),
            popupMainHorizontalPadding: 30,
            popupAppIconPadding: 0.05,
            popupIconWidth: 0.08,
            popupIconHeight: 0.08,
            popupAppTitleFontSize: FontSize.mobHeadingSize,
            popupTemplatewidth: 0.25,
            popupTemplateHorizontalPadding: 0.005,
            popupTemplateVerticalPadding: 0.015,
            gridMainPadding: 0.1,
            maxCrossAxisExtent: 600,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
            portfolioHeight: 1.5,
            portfolioHorzontalPadding: 0.05,
            portfolioVerticalPadding: 0.015,
            tabLabelFontSize: FontSize.mobcontentSize,
            tabMainPadding: 0.03,
            downloadOnTap: () => homeCtrl.downloadPdf(),
          ),
          Appconstants.sHight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contact me', style: Appstyles.headline(context, 0.035)),
            ],
          ),
          ContactMeWidget(
              size: size,
              hintFontSize: FontSize.mobcontentSize,
              fieldWidth: 1,
              sendButton: () => log('send'),
              spaceWidget: Appconstants.emptyWidget),
          FooterWidget(
            size: size,
            fontSize: FontSize.mobcontentSize,
            emailOnTap: () => homeCtrl.openMail(),
            scrollController: _scrollController,
            numberOnTap: () => log('mobile'),
            myPlatformHeight: homeCtrl.mobScrollHeights,
          )
        ],
      ),
    );
  }
}

double checkScreenSize(Size size) {
  if (size.width >= 500) {
    if (size.height >= 600) {
      return 4;
    } else {
      return 10;
    }
  } else if (size.width >= 425) {
    if (size.height >= 600) {
      return 3.5;
    } else {
      return 10;
    }
  } else if (size.width >= 375) {
    if (size.height >= 600) {
      return 3;
    } else {
      return 10;
    }
  } else if (size.width >= 200) {
    if (size.height >= 600) {
      return 2.8;
    } else {
      return 4;
    }
  } else {
    if (size.height >= 600) {
      return 3.5;
    } else {
      return 4;
    }
  }
}
