import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/centered_container.dart';
import '../widgets/stepper_header.dart';
import '../widgets/animated_nav.dart';
import 'goal_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CenteredContainer(
          child: Column(
            children: [
              AppHeader(currentStep: 0),
              SizedBox(height: 24),
              SizedBox(height: 20),
              Text('Let\'s Personalize your meal plan', style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center),
              SizedBox(height: 12),
              Text('Tell us a few things so we can tailor meals to your goals,\nlifestyle, and budget', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              SizedBox(height: 36),
              PrimaryButton(label: 'Start personalization', onPressed: () => Navigator.of(context).push(pushPage(context, GoalSelectionScreen())), variant: ButtonVariant.dark),
              SizedBox(height: 12),
              Text('Takes about 2 minutes', style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
        ),
      ),
    );
  }
}
