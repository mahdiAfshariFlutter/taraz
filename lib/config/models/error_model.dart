class ErrorModel {
  final String status;
  final String message;
  final int? statusCode;

  ErrorModel({
    required this.status,
    required this.message,
    this.statusCode,
  });
}