import 'package:flutter/material.dart';
import 'package:flux_weather_app/core/styles/app_colors.dart';

class CustomLoadingIndicator extends StatefulWidget {
  const CustomLoadingIndicator({super.key});

  @override
  CustomLoadingIndicatorState createState() => CustomLoadingIndicatorState();
}

class CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true, period: const Duration(milliseconds: 250));

    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true, period: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(_controller1),
        const SizedBox(width: 8),
        _buildDot(_controller2),
        const SizedBox(width: 8),
        _buildDot(_controller3),
      ],
    );
  }

  Widget _buildDot(AnimationController controller) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 + controller.value * 0.5,
            child: Container(
              width: 15.0,
              height: 15.0,
              decoration: const BoxDecoration(
                color: AppColors.iconColor,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
