/// This class provides the constants for the various API endpoints.
///
class Endpoints {
  Endpoints._();

  // Add the urls and parameters of the endpoints used by the application below

  static const int receiveTimeout = 5000;
  static const int connectionTimeout = 3000;

  static const String apiUrl = String.fromEnvironment('api_url', defaultValue: 'http://10.0.2.2:8080/v1');

  static const String authUrl = String.fromEnvironment('auth_url', defaultValue: 'http://10.0.2.2:8000/oauth/token');
  static const String authClient = '<your_auth_client_name>';
  static const String authSecret = String.fromEnvironment('<your_auth_client_secret>', defaultValue: '<your_secret>');
}
