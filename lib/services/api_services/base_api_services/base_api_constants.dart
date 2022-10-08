class BaseApiConstants {

  final String _spaceXUrl = 'https://api.spacexdata.com/v4/launches/';
  final String _contentType = "application/json; charset=utf-8";

  Uri get getSpaceXApiUrl => Uri.parse(_spaceXUrl);

  Map<String, String> get getTokenlessHeader {
    return {
      "Content-Type": _contentType,
    };
  }

}
