import 'package:flutter/material.dart';
import '../widgets/option_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/centered_container.dart';
import '../widgets/stepper_header.dart';
import '../widgets/animated_nav.dart';
import 'diet_preference_screen.dart';

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({Key? key}) : super(key: key);

  @override
  _GoalSelectionScreenState createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  String selected = 'Lose weight';
  final options = ['Lose weight', 'Maintain weight', 'Gain weight'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CenteredContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppHeader(currentStep: 1),
              SizedBox(height: 20),
              Text('What\'s your main goal ?', style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center),
              SizedBox(height: 8),
              Text('We\'ll tailor your meal plan around this', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: options.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 24, mainAxisSpacing: 24, childAspectRatio: 1),
                itemBuilder: (context, index) {
                  final title = options[index];
                  return OptionCard(
                    title: title,
                    subtitle: 'build muscle & get in shape',
                    selected: selected == title,
                    onTap: () => setState(() => selected = title),
                  );
                },
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(label: 'Continue', onPressed: () => Navigator.of(context).push(pushPage(context, DietPreferenceScreen())), variant: ButtonVariant.dark),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
