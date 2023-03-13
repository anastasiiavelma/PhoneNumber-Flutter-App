import 'package:flutter/material.dart';

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
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
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
                Color(0xFF8048FB),
              ],
            ),
          ),
          child: ListTile(
            title: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 80, 120, 160),
                  child: Text('Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 71,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('+1',
                            style: TextStyle(
                              color: Colors.black38,
                            )),
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide.none,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0x66F4F5FF)),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.fromLTRB(20, 0, 5, 0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 256,
                      height: 48,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: const Color(0x66F4F5FF),
                          hintText: 'Enter phone number',
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
                        controller: _controller,
                        onSubmitted: (String value) {
                          debugPrint(value);
                        },
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xA6F4F5FF),
        child: const Icon(
          Icons.arrow_right_alt_outlined,
          color: Colors.black45,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 3, color: Colors.transparent),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
