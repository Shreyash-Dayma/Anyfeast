import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/centered_container.dart';
import '../widgets/stepper_header.dart';
import '../widgets/animated_nav.dart';
import '../theme/app_theme.dart';
import 'activity_level_screen.dart';
import 'cooking_lifestyle_screen.dart';
import 'budget_selection_screen.dart';
import 'success_screen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  Widget line(String title, String value, VoidCallback onChange) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(fontWeight: FontWeight.w600)), SizedBox(height: 6), Text('• $value', style: TextStyle(color: Colors.grey[700]))])),
            TextButton(onPressed: onChange, child: Text('change', style: TextStyle(color: AppColors.red)))
          ],
        ),
        SizedBox(height: 8),
        Divider()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CenteredContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(currentStep: 2),
              SizedBox(height: 20),
              Text('Review and generate your plan', style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 8),
              Text('confirm your preferences below .you can change anything before generating', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 20),

              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      line('Activity level', 'Moderately active', () => Navigator.of(context).push(pushPage(context, ActivityLevelScreen()))),
                      line('Cooking lifestyle', 'regular cooking', () => Navigator.of(context).push(pushPage(context, CookingLifestyleScreen()))),
                      line('Budget range', 'balanced', () => Navigator.of(context).push(pushPage(context, BudgetSelectionScreen()))),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [PrimaryButton(label: 'Back', onPressed: () => Navigator.pop(context), variant: ButtonVariant.outline), PrimaryButton(label: 'Generate', onPressed: () => Navigator.of(context).push(pushPage(context, SuccessScreen())), variant: ButtonVariant.primary)])
            ],
          ),
        ),
      ),
    );
  }
}
