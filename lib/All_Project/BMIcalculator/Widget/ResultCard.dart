import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../StudentProfileCard/Widget/TextDesign.dart';
import '../Core/ColorTheme.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.bmi,
    required this.category,
    required this.categoryColor,
  });

  final double bmi;
  final String category;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 8),
            TextDesign(
              text: 'Your BMI is...!',
              fontSize: 18.sp,
              color: Colors.grey[700]!,
            ),
            TextDesign(
              text: bmi.toStringAsFixed(1),
              fontSize: 60.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black.withValues(alpha: 0.8),
            ),
            SizedBox(height: 8),
            Container(
              padding: .symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: categoryColor.withValues(alpha: .18),
                borderRadius: .circular(10),
              ),
              child: TextDesign(
                text: category,
                fontSize: 18.sp,
                color: Colors.grey[900]!,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12),
            _BmiGauge(bmi: bmi),
          ],
        ),
      ),
    );
  }
}

class _BmiGauge extends StatelessWidget {
  const _BmiGauge({super.key, required this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    return AnimatedRadialGauge(
      duration: const Duration(milliseconds: 800),
      curve: Curves.elasticOut,
      radius: 100,
      value: bmi.clamp(10, 40),
      axis: const GaugeAxis(
        min: 10,
        max: 40,
        sweepDegrees: 180,
        style: GaugeAxisStyle(
          thickness: 16,
          background: Colors.white,
          zoneSpacing: 3,
          blendColors: false,
        ),

        pointer: GaugePointer.needle(
          width: 14,
          height: 60,
          color: Colors.black45,
        ),
        progressBar: GaugeProgressBar.rounded(color: Colors.transparent),
        zones: [
          GaugeZone(
            from: 10,
            to: 18.5,
            color: ColorTheme.blueColor,
            cornerRadius: Radius.zero,
          ),
          GaugeZone(
            from: 18.5,
            to: 25,
            color: ColorTheme.greenColor,
            cornerRadius: Radius.zero,
          ),
          GaugeZone(
            from: 25,
            to: 30,
            color: ColorTheme.yellowColor,
            cornerRadius: Radius.zero,
          ),
          GaugeZone(
            from: 30,
            to: 40,
            color: ColorTheme.redColor,
            cornerRadius: Radius.zero,
          ),
        ],
      ),
    );
  }
}
