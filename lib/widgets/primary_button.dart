import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

enum ButtonVariant { primary, dark, outline }

class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  const PrimaryButton({Key? key, required this.label, this.onPressed, this.variant = ButtonVariant.primary}) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails _) => setState(() => _scale = 0.97);
  void _onTapUp(TapUpDetails _) => setState(() => _scale = 1.0);
  void _onTapCancel() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    final height = 56.0;
    final radius = BorderRadius.circular(28.0);

    final variant = widget.variant;
    if (variant == ButtonVariant.outline) {
      return GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: AnimatedScale(
          duration: Duration(milliseconds: 120),
          scale: _scale,
          child: SizedBox(
            height: height,
            child: OutlinedButton(
              onPressed: widget.onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade400),
                shape: RoundedRectangleBorder(borderRadius: radius),
                backgroundColor: Colors.white,
              ),
              child: Text(widget.label, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.darkGray)),
            ),
          ),
        ),
      );
    }

    final background = variant == ButtonVariant.dark ? AppColors.darkGray : AppColors.red;
    final labelColor = Colors.white;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        duration: Duration(milliseconds: 120),
        scale: _scale,
        child: SizedBox(
          height: height,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: background,
              shape: RoundedRectangleBorder(borderRadius: radius),
            ),
            child: Text(widget.label, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: labelColor)),
          ),
        ),
      ),
    );
  }
}
