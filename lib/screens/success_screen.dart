import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _iconScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _scale = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _iconScale = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Interval(0.4, 1.0, curve: Curves.elasticOut)));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            color: Color(0xFFB92424),
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Transform.scale(
                scale: _scale.value,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 760),
                  padding: EdgeInsets.symmetric(vertical: 48, horizontal: 40),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    ScaleTransition(
                      scale: _iconScale,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(color: Color(0xFFB92424), shape: BoxShape.circle),
                        child: Icon(Icons.check, color: Colors.white, size: 44),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text('Your meal plan is ready', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
                    SizedBox(height: 8),
                    Text('Based on your activity level cooking style and budget', style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 24),
                    PrimaryButton(label: 'View my plans', onPressed: () {}),
                    SizedBox(height: 12),
                    TextButton(onPressed: () {}, child: Text('Edit preferences', style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey[800]))),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
