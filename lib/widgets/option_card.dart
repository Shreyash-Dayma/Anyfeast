import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OptionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final Widget? leading;
  final VoidCallback? onTap;
  const OptionCard({Key? key, required this.title, this.subtitle = '', this.selected = false, this.leading, this.onTap}) : super(key: key);

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.selected;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 260),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: isSelected ? AppColors.red : Colors.grey.withOpacity(0.35), width: isSelected ? 2.5 : 1.0),
            boxShadow: [_hover ? BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: Offset(0, 6)) : BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 6, offset: Offset(0, 3))],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.leading != null) widget.leading!,
                  SizedBox(height: 10),
                  Text(widget.title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                  if (widget.subtitle.isNotEmpty) SizedBox(height: 6),
                  if (widget.subtitle.isNotEmpty) Text(widget.subtitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                ],
              ),

              // selected dot
              Positioned(
                top: -10,
                left: -10,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 260),
                  opacity: isSelected ? 1.0 : 0.0,
                  child: AnimatedScale(
                    duration: Duration(milliseconds: 260),
                    scale: isSelected ? 1.0 : 0.5,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(color: AppColors.red, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
