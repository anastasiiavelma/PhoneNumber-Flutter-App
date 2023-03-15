import 'package:flutter/material.dart';
import 'package:phone_number_app/api/country_model.dart';
import 'package:phone_number_app/main.dart';

class CountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void closeSheet(String code, String flag) =>
        Navigator.pop(context, [code, flag]);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF8EAAFB),
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
                    color: Color(0x66F4F5FF),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      size: 15,
                      color: Color(0xFF594C74),
                    ),
                    style: ButtonStyle(
                      iconColor: const MaterialStatePropertyAll<Color>(
                          Color(0xFF594C74)),
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
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        closeSheet(
                            '${snapshot.data![index].code}${snapshot.data![index].suffix}',
                            snapshot.data![index].flag.toString());
                      },
                      child: ListTile(
                        leading: Image.network(
                          snapshot.data![index].flag,
                          height: 20,
                          width: 38,
                        ),
                        title: Row(
                          children: [
                            Text(
                              '${snapshot.data![index].code}${snapshot.data![index].suffix}',
                              style: TextStyle(color: Colors.black45),
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
                      ),
                    );
                  },
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
