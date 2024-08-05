import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final Color color;
  final OutlinedBorder shape;

  const ElevatedButtonWidget({
    super.key,
    required this.name,
    required this.onTap,
    this.color = Colors.blue,
    this.shape = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color, // Button color
        shape: shape, // Button shape
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        // textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: Text(name),
    );
  }
}
