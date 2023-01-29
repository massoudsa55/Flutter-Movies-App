import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class InternetFailure extends Failure {
  const InternetFailure(super.message);
}

class LocalDatabaseFailure extends Failure {
  const LocalDatabaseFailure(super.message);
}
