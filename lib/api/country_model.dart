import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;

class CountryModel extends Equatable {
  const CountryModel({
    required this.nameCommon,
    required this.code,
    required this.flag,
    required this.suffix,
  });

  final String nameCommon;
  final String code;
  final String flag;
  final String suffix;

  @override
  List<Object?> get props => [
        nameCommon,
      ];

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    final suffix = json['idd']['suffixes'] != null
        ? json['idd']['suffixes'][0]
        : 'doesnt exit';
    final code = json['idd']['root'] != null ? json['idd']['root'] : '';

    return CountryModel(
      code: code,
      suffix: suffix,
      nameCommon: json["name"]["common"],
      flag: json['flags']['png'].toString(),
    );
  }
}

Future<List<CountryModel>> getCountry(String countryCode) async {
  final response = await http
      .get(Uri.parse('https://restcountries.com/v3.1/alpha/${countryCode}'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<CountryModel> country =
        data.map((item) => CountryModel.fromJson(item)).toList();

    return country;
  } else {
    throw Exception('Failed to fetch country');
  }
}

Future<List<CountryModel>> getCountries() async {
  final response =
      await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<CountryModel> countries =
        data.map((item) => CountryModel.fromJson(item)).toList();

    return countries;
  } else {
    throw Exception('Failed to fetch countries');
  }
}
