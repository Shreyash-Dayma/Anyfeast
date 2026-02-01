import 'package:flutter/material.dart';
import '../widgets/option_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/centered_container.dart';
import '../widgets/stepper_header.dart';
import '../widgets/animated_nav.dart';
import 'cooking_lifestyle_screen.dart';

class ActivityLevelScreen extends StatefulWidget {
  const ActivityLevelScreen({Key? key}) : super(key: key);

  @override
  _ActivityLevelScreenState createState() => _ActivityLevelScreenState();
}

class _ActivityLevelScreenState extends State<ActivityLevelScreen> {
  final options = ['Very active', 'Moderately active', 'Lightly active', 'Mostly sedentary'];
  String selected = 'Moderately active';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CenteredContainer(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            AppHeader(currentStep: 1),
            SizedBox(height: 20),
            Text('How active are you?', style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center),
            SizedBox(height: 8),
            Text('Choose what best describes your usual day. This helps us adjust portion sizes.', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final o = options[index];
                return OptionCard(title: o, subtitle: 'regular exercise or active job', selected: selected == o, onTap: () => setState(() => selected = o));
              },
            ),

            SizedBox(height: 24),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [PrimaryButton(label: 'Back', onPressed: () => Navigator.pop(context), variant: ButtonVariant.outline), PrimaryButton(label: 'Continue', onPressed: () => Navigator.of(context).push(pushPage(context, CookingLifestyleScreen())), variant: ButtonVariant.dark)])
          ]),
        ),
      ),
    );
  }
}
