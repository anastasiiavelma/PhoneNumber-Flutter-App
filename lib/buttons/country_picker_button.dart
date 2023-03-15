import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:phone_number_app/api/country_model.dart';
import 'package:phone_number_app/widgets/country_list_screen.dart';

class CountryPickerButton extends StatefulWidget {
  const CountryPickerButton({super.key});

  @override
  State<CountryPickerButton> createState() => _CountryPickerButtonState();
}

class _CountryPickerButtonState extends State<CountryPickerButton> {
  String code = '';
  String flag = '';

  @override
  void initState() {
    super.initState();
    getCountry('ukr').then((result) {
      print("dddddddddd");
      CountryModel countryModel = result[0];
      setState(() {
        code = '${countryModel.code}${countryModel.suffix}';
        flag = countryModel.flag;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (code != '' && flag != '') {
      return ElevatedButton(
        onPressed: () async {
          final result = await showCupertinoModalBottomSheet(
              context: context,
              backgroundColor: Color.fromARGB(255, 37, 43, 59),
              builder: (context) => Expanded(
                      child: Stack(
                    children: [
                      CountryList(),
                    ],
                  )));
          if (result != null) {
            setState(() {
              code = result[0];
              flag = result[1];
            });
          }
        },
        // ignore: sort_child_properties_last
        child: Row(
          children: [
            // Image.network(
            //   // flag,
            //   // height: 5,
            //   // width: 10,
            // ),
            Text(
              code,
              style: const TextStyle(color: Color(0xFF594C74), fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide.none,
            ),
          ),
          shadowColor:
              MaterialStateProperty.all<Color>(const Color(0x66F4F5FF)),
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0x66F4F5FF)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.fromLTRB(20, 0, 5, 0),
          ),
        ),
      );
    } else {
      return Container(
          color: const Color(0xFF8EAAFB),
          child: const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0x66F4F5FF))),
          ));
    }
  }
}
