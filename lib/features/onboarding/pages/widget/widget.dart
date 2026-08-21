import 'package:flutter/material.dart';

import '../../model/model.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final width = size.width;
    final height = size.height;

    final isTablet = width > 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
      child: Column(
        children: [
          /// IMAGE
          SizedBox(
            height: height * 0.35,
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    model.image,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                /// GRADIENT OVERLAY
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.35),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: height * 0.03),

          /// TITLE
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
            ),
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: isTablet ? 32 : width * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: height * 0.03),

          /// SUBTITLE
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.08,
            ),
            child: Text(
              model.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: isTablet ? 18 : width * 0.042,
                height: 1.5,
              ),
            ),
          ),

          SizedBox(height: height * 0.05),
        ],
      ),
    );
  }
}