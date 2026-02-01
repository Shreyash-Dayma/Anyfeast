import 'package:flutter/material.dart';
import '../widgets/option_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/centered_container.dart';
import '../widgets/stepper_header.dart';
import '../widgets/animated_nav.dart';
import 'review_screen.dart';

class BudgetSelectionScreen extends StatefulWidget {
  const BudgetSelectionScreen({Key? key}) : super(key: key);

  @override
  _BudgetSelectionScreenState createState() => _BudgetSelectionScreenState();
}

class _BudgetSelectionScreenState extends State<BudgetSelectionScreen> {
  final options = ['Budget friendly', 'Balanced', 'Flexible'];
  String selected = 'Balanced';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CenteredContainer(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            AppHeader(currentStep: 1),
            SizedBox(height: 20),
            Text('What budget feels comfortable for you?', style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center),
            SizedBox(height: 8),
            Text('This helps us suggest meals that fit your spending preferences', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: options.map((o) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: OptionCard(title: o, selected: selected == o, onTap: () => setState(() => selected = o)),
              )).toList(),
            ),
            SizedBox(height: 24),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [PrimaryButton(label: 'Back', onPressed: () => Navigator.pop(context), variant: ButtonVariant.outline), PrimaryButton(label: 'Continue', onPressed: () => Navigator.of(context).push(pushPage(context, ReviewScreen())), variant: ButtonVariant.primary)])
          ]),
        ),
      ),
    );
  }
}
