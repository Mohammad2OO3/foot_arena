// import 'package:evowash_user_flutter_app/common/design/design.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class CustomRatingWidget extends StatelessWidget {
//   ValueNotifier<double> rate;
//
//   CustomRatingWidget({super.key, required this.rate});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       // child: AnimatedRatingStars(
//       //   initialRating: rate.value,
//       //   minRating: 0.0,
//       //   maxRating: 5.0,
//       //   filledColor: context.starsRateColor,
//       //   emptyColor: context.textColor,
//       //   onChanged: (double rating) {
//       //     rate.value = rating;
//       //     // Handle the rating change here
//       //     print('Rating: $rating');
//       //   },
//       //   displayRatingValue: true,
//       //   interactiveTooltips: true,
//       //   customFilledIcon: Icons.star,
//       //
//       //   customHalfFilledIcon: Icons.star_half,
//       //   customEmptyIcon: Icons.star_outline,
//       //   starSize: 50.0,
//       //   animationDuration: Duration(milliseconds: 300),
//       //   animationCurve: Curves.easeInOut,
//       //   readOnly: false,
//       //
//       //
//       //
//       // ),
//       child: RatingBar(
//         initialRating: rate.value,
//         direction: Axis.horizontal,
//         allowHalfRating: true,
//         itemCount: 5,
//         ratingWidget: RatingWidget(
//           full: SvgAsset(Assets.images.svg.review.starFilled, height: 36),
//           half:
//           FlippableStar(child: SvgAsset(Assets.images.svg.review.starHalf, height: 36)),
//
//           empty: SvgAsset(Assets.images.svg.review.starEmpty, height: 36),
//         ),
//         itemPadding: EdgeInsets.symmetric(horizontal: 10),
//         onRatingUpdate: (rating) {
//           print(rating);
//           rate.value=rating;
//         },
//         glow: false,
//       ),
//     );
//   }
// }
//
// class FlippableStar extends StatelessWidget {
//   final Widget child;
//
//
//   const FlippableStar({
//     super.key,
//     required this.child,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Transform(
//       alignment: Alignment.center,
//       transform: Matrix4.identity()
//         ..rotateY( 3.1415926535897932 ),
//       child: child,
//     );
//   }
// }
