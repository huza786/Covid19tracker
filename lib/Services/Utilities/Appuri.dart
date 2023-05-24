class AppURL {
  //this is base url always use base url in api so that in future if url changes you will change only base url
  static const String baseUrl = 'https://disease.sh/v3/covid-19/';
  //fetch world states
  static const String worldStatesApi = '${baseUrl}all';
  static const String countriesList = '${baseUrl}countries';
}
