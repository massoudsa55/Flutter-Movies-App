import '../network/error_message_model.dart';

class InternetException implements Exception {
  final ErrorMessageModel errorMessageModel;
  InternetException({
    required this.errorMessageModel,
  });
}

class LocalDatabaseException implements Exception {
  final String message;
  LocalDatabaseException({
    required this.message,
  });
}
