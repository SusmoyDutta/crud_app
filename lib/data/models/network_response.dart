class NetworkResponse {
  final bool isSuccess;
  final dynamic responseData;
  final int? responseCode;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    this.responseData,
    this.responseCode,
    this.errorMessage = '',
  });
}
