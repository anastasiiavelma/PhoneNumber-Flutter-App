import 'package:flutter/material.dart';
import 'package:phone_number_app/api/country_model.dart';
import 'package:phone_number_app/main.dart';

class CountryList extends StatefulWidget {
  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  final controller = TextEditingController();
  String searchString = "";

  @override
  Widget build(BuildContext context) {
    void closeSheet(String code, String flag) =>
        Navigator.pop(context, [code, flag]);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF8EAAFB),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Country code",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0x66F4F5FF),
                  ),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      size: 15,
                      color: Color(0xFF594C74),
                    ),
                    style: const ButtonStyle(
                      iconColor:
                          MaterialStatePropertyAll<Color>(Color(0xFF594C74)),
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            )),
        body: FutureBuilder<List<CountryModel>>(
          future: getCountries(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                color: const Color(0xFF8EAAFB),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            searchString = value;
                          });
                        },
                        autofocus: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: const Color(0x66F4F5FF),
                          hintText: 'Search',
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
                        controller: controller,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          String codeAndSuf =
                              '${snapshot.data![index].code}${snapshot.data![index].suffix}';
                          return GestureDetector(
                            onTap: () {
                              closeSheet(codeAndSuf,
                                  snapshot.data![index].flag.toString());
                            },
                            child: snapshot.data![index].nameCommon
                                        .toLowerCase()
                                        .contains(searchString.toLowerCase()) ||
                                    codeAndSuf.contains(searchString)
                                ? ListTile(
                                    leading: Image.network(
                                      snapshot.data![index].flag,
                                      height: 20,
                                      width: 38,
                                      fit: BoxFit.fill,
                                    ),
                                    title: Row(
                                      children: [
                                        Text(
                                          codeAndSuf,
                                          style: const TextStyle(
                                              color: Colors.black45),
                                        ),
                                        Text(
                                          '  ${snapshot.data![index].nameCommon}',
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Container(
                  color: const Color(0xFF8EAAFB),
                  child: const Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0x66F4F5FF))),
                  ));
            }
          },
        ),
      ),
    );
  }
}
