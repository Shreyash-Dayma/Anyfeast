import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PillOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  const PillOption({Key? key, required this.label, this.selected = false, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.red : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? AppColors.red : Colors.grey.withOpacity(0.2)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4)],
        ),
        child: Text(label, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: selected ? Colors.white : AppColors.textPrimary)),
      ),
    );
  }
}
