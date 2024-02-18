class NetworkResponse {
  final int statusCode;
  final String responseMessage;
  final dynamic data;

  NetworkResponse(
      {required this.statusCode, required this.responseMessage, this.data});
}
