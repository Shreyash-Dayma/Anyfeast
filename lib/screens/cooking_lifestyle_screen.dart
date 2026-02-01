import 'package:flutter/material.dart';
import '../widgets/option_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/centered_container.dart';
import '../widgets/stepper_header.dart';
import '../widgets/animated_nav.dart';
import 'budget_selection_screen.dart';

class CookingLifestyleScreen extends StatefulWidget {
  const CookingLifestyleScreen({Key? key}) : super(key: key);

  @override
  _CookingLifestyleScreenState createState() => _CookingLifestyleScreenState();
}

class _CookingLifestyleScreenState extends State<CookingLifestyleScreen> {
  final options = ['Don\'t cook', 'Simple&quick meals', 'Regular cooking', 'love cooking'];
  String selected = 'Simple&quick meals';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CenteredContainer(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            AppHeader(currentStep: 1),
            SizedBox(height: 20),
            Text('How do you usually prepare meals?', style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center),
            SizedBox(height: 8),
            Text('This helps us suggest meals that fit your routine and time', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final o = options[index];
                return OptionCard(title: o, selected: selected == o, onTap: () => setState(() => selected = o));
              },
            ),

            SizedBox(height: 24),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [PrimaryButton(label: 'Back', onPressed: () => Navigator.pop(context), variant: ButtonVariant.outline), PrimaryButton(label: 'Continue', onPressed: () => Navigator.of(context).push(pushPage(context, BudgetSelectionScreen())), variant: ButtonVariant.dark)])
          ]),
        ),
      ),
    );
  }
}
