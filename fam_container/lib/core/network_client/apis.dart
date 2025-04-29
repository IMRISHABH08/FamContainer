class Urls {
  Urls._();
  static const baseUrl = 'https://polyjuice.kong.fampay.co';

  static const getUiConfig = '/mock/famapp/feed/home_section/';

  static String famUrl(String section) => '$baseUrl$section';
}
