import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CountryPickerButton extends StatelessWidget {
  const CountryPickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      // ignore: sort_child_properties_last
      child: const Text('+1',
          style: TextStyle(
            color: Colors.black38,
          )),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide.none,
          ),
        ),
        shadowColor: MaterialStateProperty.all<Color>(const Color(0x66F4F5FF)),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0x66F4F5FF)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.fromLTRB(20, 0, 5, 0),
        ),
      ),
    );
  }
}
