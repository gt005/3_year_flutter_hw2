import 'package:flutter/material.dart';

class LoadMoreButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LoadMoreButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text("Загрузить еще"),
      ),
    );
  }
}
