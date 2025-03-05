abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

/// Failure related to server communication.
class ServerFailure extends Failure {
  final int? statusCode;
  final String? endpoint;

  const ServerFailure({
    required String message,
    this.statusCode,
    this.endpoint,
  }) : super(message);

  @override
  String toString() {
    String details = super.toString();
    if (statusCode != null) details += ' (Status Code: $statusCode)';
    if (endpoint != null) details += ' [Endpoint: $endpoint]';
    return details;
  }
}

/// Failure due to timeout.
class TimeoutFailure extends ServerFailure {
  const TimeoutFailure({
    required super.message,
    super.endpoint,
  });
}

/// Failure due to unauthorized access.
class UnauthorizedFailure extends ServerFailure {
  const UnauthorizedFailure({
    required super.message,
    super.endpoint,
  }) : super(statusCode: 401);
}

/// Failure due to forbidden access.
class ForbiddenFailure extends ServerFailure {
  const ForbiddenFailure({
    required super.message,
    super.endpoint,
  }) : super(statusCode: 403);
}

/// Failure due to not found (404).
class NotFoundFailure extends ServerFailure {
  const NotFoundFailure({
    required super.message,
    super.endpoint,
  }) : super(statusCode: 404);
}

/// Failure due to internal server error (500).
class InternalServerErrorFailure extends ServerFailure {
  const InternalServerErrorFailure({
    required super.message,
    super.endpoint,
  }) : super(statusCode: 500);
}

/// Failure due to unknown errors.
class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
