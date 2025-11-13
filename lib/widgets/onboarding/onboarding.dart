/*
 * Project: Flutter Starter
 * File: onboarding.dart
 * 
 * Created: 2024-09-30 by Luca Biasotto (https://github.com/lucabiasotto/)
 * 
 * Copyright (c) 2024 - 2024, Luca Biasotto
 */

import 'package:app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static final _log = Logger('Onboarding');

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: "welcome",
      description: "welcome_description",
    ),
    OnboardingPage(
      title: "explore",
      description: "explore_description",
    ),
    OnboardingPage(
      title: "get_started",
      description: "get_started_description",
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _completeOnboarding() {
    _log.fine("On Boarding done.");
    AppController.to.setOnboardingDone(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("onboarding".tr),
        elevation: 0,
      ),
      body: Column(
        children: [
          // PageView
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(32.dg),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      // Icon placeholder
                      Container(
                        width: 120.dg,
                        height: 120.dg,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _getIconForPage(index),
                          size: 60.dg,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 48.h),
                      // Title
                      Text(
                        _pages[index].title.tr,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.sp,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      // Description
                      Text(
                        _pages[index].description.tr,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[600],
                              fontSize: 16.sp,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
          ),

          // Page indicators
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: _currentPage == index ? 24.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Theme.of(context).primaryColor : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ),

          // Navigation buttons
          Padding(
            padding: EdgeInsets.all(24.dg),
            child: Row(
              children: [
                // Back button
                if (_currentPage > 0)
                  TextButton(
                    onPressed: _previousPage,
                    child: Text('back'.tr),
                  )
                else
                  SizedBox(width: 80.w),

                const Spacer(),

                // Next/Complete button
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 12.h,
                    ),
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'get_started'.tr : 'next'.tr,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForPage(int index) {
    switch (index) {
      case 0:
        return Icons.waving_hand;
      case 1:
        return Icons.explore;
      case 2:
        return Icons.rocket_launch;
      default:
        return Icons.star;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class OnboardingPage {
  final String title;
  final String description;

  OnboardingPage({
    required this.title,
    required this.description,
  });
}
