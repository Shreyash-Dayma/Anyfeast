import 'package:flutter/material.dart';
import '../widgets/pill_option.dart';
import '../widgets/primary_button.dart';
import '../widgets/centered_container.dart';
import '../widgets/stepper_header.dart';
import '../widgets/animated_nav.dart';
import 'activity_level_screen.dart';

class DietPreferenceScreen extends StatefulWidget {
  const DietPreferenceScreen({Key? key}) : super(key: key);

  @override
  _DietPreferenceScreenState createState() => _DietPreferenceScreenState();
}

class _DietPreferenceScreenState extends State<DietPreferenceScreen> {
  final List<String> diets = ['Vegetarian', 'Non-Vegetarian', 'Eggetarian', 'Vegan'];
  String selected = 'Vegetarian';

  final allergiesController = TextEditingController();
  final dislikesController = TextEditingController();

  @override
  void dispose() {
    allergiesController.dispose();
    dislikesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CenteredContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(currentStep: 1),
              SizedBox(height: 20),
              Text('What\'s your Diet preferences?', style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 8),
              Text('This helps us suggest meals you\'ll actually enjoy', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 20),

              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: diets.map((d) => PillOption(label: d, selected: selected == d, onTap: () => setState(() => selected = d))).toList(),
              ),

              SizedBox(height: 8),
              Text('+ Add more preferences', style: TextStyle(color: Colors.grey[600])),

              SizedBox(height: 20),
              Text('Allergies', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 8),
              Row(children: [Expanded(child: TextField(controller: allergiesController, decoration: InputDecoration(hintText: 'Type here (eg. peanuts, shellfish)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))))), SizedBox(width: 12), PrimaryButton(label: 'Add', onPressed: () {}, variant: ButtonVariant.outline)]),

              SizedBox(height: 24),
              Text('disliked items', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 8),
              Row(children: [Expanded(child: TextField(controller: dislikesController, decoration: InputDecoration(hintText: 'Type here (eg. peanuts, shellfish)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))))), SizedBox(width: 12), PrimaryButton(label: 'Add', onPressed: () {}, variant: ButtonVariant.outline)]),

              SizedBox(height: 28),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [PrimaryButton(label: 'Back', onPressed: () => Navigator.pop(context), variant: ButtonVariant.outline), PrimaryButton(label: 'Continue', onPressed: () => Navigator.of(context).push(pushPage(context, ActivityLevelScreen())), variant: ButtonVariant.dark)])
            ],
          ),
        ),
      ),
    );
  }
}
