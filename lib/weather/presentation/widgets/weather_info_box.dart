import 'package:flutter/material.dart';

class WeatherInfoBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherInfoBox({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall 
        ),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
