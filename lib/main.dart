import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/welcome_screen.dart';
import 'screens/goal_selection_screen.dart';
import 'screens/diet_preference_screen.dart';
import 'screens/activity_level_screen.dart';
import 'screens/cooking_lifestyle_screen.dart';
import 'screens/budget_selection_screen.dart';
import 'screens/review_screen.dart';
import 'screens/success_screen.dart';

void main() {
  runApp(const AnyfeastApp());
}

class AnyfeastApp extends StatelessWidget {
  const AnyfeastApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anyfeast',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/goal': (context) => GoalSelectionScreen(),
        '/diet': (context) => DietPreferenceScreen(),
        '/activity': (context) => ActivityLevelScreen(),
        '/cooking': (context) => CookingLifestyleScreen(),
        '/budget': (context) => BudgetSelectionScreen(),
        '/review': (context) => ReviewScreen(),
        '/success': (context) => SuccessScreen(),
      },
    );
  }
} 
