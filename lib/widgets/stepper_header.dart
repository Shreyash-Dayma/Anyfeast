import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProgressStepper extends StatelessWidget {
  final int currentStep; // 0..2
  final List<String> steps;
  const ProgressStepper({Key? key, this.currentStep = 0, this.steps = const ['Getting started', 'personalize', 'Almost done']}) : super(key: key);

  Color _circleColor(int index) {
    if (index < currentStep) return AppColors.red;
    if (index == currentStep) return AppColors.red;
    return Colors.white;
  }

  Color _borderColor(int index) => index <= currentStep ? AppColors.red : Colors.grey.withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(steps.length, (index) {
            final done = index <= currentStep;
            return Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: done ? AppColors.red : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: done ? AppColors.red : Colors.grey.withOpacity(0.5)),
                  ),
                  child: done ? Icon(Icons.check, size: 16, color: Colors.white) : SizedBox.shrink(),
                ),
                if (index != steps.length - 1)
                  Container(
                    width: 110,
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    color: Colors.grey.withOpacity(0.2),
                  ),
              ],
            );
          }),
        ),
        SizedBox(height: 10),
        // underline accent
        Container(height: 6, width: 260, decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.grey.shade200, AppColors.red.withOpacity(0.8), Colors.grey.shade200])),),
      ],
    );
  }
}

class AppHeader extends StatelessWidget {
  final int currentStep;
  const AppHeader({Key? key, this.currentStep = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Row(children: [
              Container(width: 44, height: 44, decoration: BoxDecoration(color: AppColors.red, borderRadius: BorderRadius.circular(8)), child: Icon(Icons.home, color: Colors.white)),
              SizedBox(width: 12),
              Text('AnyFeast', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            ]),
            Spacer(),
            // small spacing for potential account icon
            Icon(Icons.account_circle_outlined, color: Colors.grey[400]),
          ],
        ),
        SizedBox(height: 18),
        ProgressStepper(currentStep: currentStep),
        SizedBox(height: 18),
      ],
    );
  }
}
