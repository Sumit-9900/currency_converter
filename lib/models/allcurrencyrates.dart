// To parse this JSON data, do
//
//     final allcurrencyrates = allcurrencyratesFromJson(jsonString);

import 'dart:convert';

Allcurrencyrates allcurrencyratesFromJson(String str) =>
    Allcurrencyrates.fromJson(json.decode(str));

String allcurrencyratesToJson(Allcurrencyrates data) =>
    json.encode(data.toJson());

class Allcurrencyrates {
  String disclaimer;
  String license;
  int timestamp;
  String base;
  Map<String, double> rates;

  Allcurrencyrates({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  factory Allcurrencyrates.fromJson(Map<String, dynamic> json) =>
      Allcurrencyrates(
        disclaimer: json["disclaimer"],
        license: json["license"],
        timestamp: json["timestamp"],
        base: json["base"],
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "license": license,
        "timestamp": timestamp,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
