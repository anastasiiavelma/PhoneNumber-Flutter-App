import 'package:flutter/material.dart';

class CheckedButton extends StatelessWidget {
  final active;

  const CheckedButton({super.key, this.active});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: ElevatedButton(
        onPressed: active
            ? null
            : () {
                showText();
              },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
              active ? const Color(0x66F4F5FF) : Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: const Icon(
          weight: 50,
          color: Color(0xFF594C74),
          Icons.arrow_forward,
          size: 18,
        ),
      ),
    );
  }

  showText() {
    print("Well done!");
  }
}
