import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_number_app/widgets/phone_number_format.dart';
import 'buttons/checked_button.dart';
import 'buttons/country_picker_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EnterNumberScreen(),
    );
  }
}

class EnterNumberScreen extends StatefulWidget {
  const EnterNumberScreen({super.key});

  @override
  State<EnterNumberScreen> createState() => _EnterNumberScreenState();
}

class _EnterNumberScreenState extends State<EnterNumberScreen> {
  final myController = TextEditingController();
  bool isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF8DA9FA),
                Color(0xFF8EAAFB),
              ],
            ),
          ),
          child: ListTile(
            title: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 80, 120, 160),
                  child: SizedBox(
                    width: 344,
                    height: 40,
                    child: Text('Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ),
                Row(
                  children: [
                    CountryPickerButton(),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          PhoneNumberTextInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: const Color(0x66F4F5FF),
                          hintText: '(453) 453-4563',
                          hintStyle: const TextStyle(
                              fontSize: 16.0,
                              color: Color(0xD9594C74),
                              fontWeight: FontWeight.normal),
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        controller: myController,
                        onChanged: (text) {
                          if (text.length >= 14) {
                            setState(() {
                              isButtonDisabled = false;
                            });
                          } else {
                            setState(() {
                              isButtonDisabled = true;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CheckedButton(active: isButtonDisabled),
    );
  }
}
