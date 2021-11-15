class CustomApiException implements Exception {
  late final dynamic _message;
  late final dynamic _prefix;

  String toString() {
    print('http error: $_message');
    return '$_prefix$_message';
  }

  CustomApiException(this._message, this._prefix);
}

class FetchDataException extends CustomApiException {
  FetchDataException(message) : super(message, 'Fail to get data:\n');
}

class BadRequestException extends CustomApiException {
  BadRequestException(message) : super(message, 'Invalid Request:\n');
}

class UnauthorisedException extends CustomApiException {
  UnauthorisedException(message) : super(message, 'Unauthorised:\n');
}

class InvalidInputException extends CustomApiException {
  InvalidInputException(message) : super(message, 'Invalid Input:\n');
}
