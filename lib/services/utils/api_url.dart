class Api {
  static const String appid = '29a844fee0124df1b4667a6130b48f2a';
  static const String baseUrl = 'https://openexchangerates.org/api/';
  static const String allcurrencyratesApi =
      '${baseUrl}latest.json?app_id=$appid';
  static const String allcurrencyApi =
      '${baseUrl}currencies.json?app_id=$appid';
}
