import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/assets_manager.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/color_manager.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/constants_manager.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/strings_manager.dart';
import 'package:flutter_clean_architecture_with_mvvm/resources/values_manager.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderDate();

  List<SliderObject> _getSliderDate() => [
        SliderObject(
          title: AppStrings.onBoardingTitle1,
          subTitle: AppStrings.onBoardingSubTitle1,
          image: ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          title: AppStrings.onBoardingTitle2,
          subTitle: AppStrings.onBoardingSubTitle2,
          image: ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          title: AppStrings.onBoardingTitle3,
          subTitle: AppStrings.onBoardingSubTitle3,
          image: ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          title: AppStrings.onBoardingTitle4,
          subTitle: AppStrings.onBoardingSubTitle4,
          image: ImageAssets.onboardingLogo4,
        ),
      ];
  final PageController pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return OnBoardingPage(slider: _list[index]);
          },
          onPageChanged: (value) => _currentIndex = value,
        ),
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.end,
                ),
              ),
            ),

            // widges indicator and arrows
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left arrow
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrowIc),
                ),
                onTap: () {
                  pageController.animateToPage(
                    _getPreviousIndex(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut,
                  );
                },
              ),
            ),

            // circle indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _list.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: _getProperCircle(i),
                  )
              ],
            ),

            // right arrow
            Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  width: AppSize.s20,
                  height: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.rightArrowIc),
                ),
                onTap: () {
                  pageController.animateToPage(
                    _getNextIndex(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getPreviousIndex() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index) {
    if (_currentIndex == index) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject slider;
  const OnBoardingPage({super.key, required this.slider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: AppSize.s40),
          Text(
            slider.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            slider.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSize.s40),
          SvgPicture.asset(slider.image)
        ],
      ),
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
