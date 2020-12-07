enum HttpStatus { Ok, Created, BadRequest, Error, NotFound }

class HttpResult<T> {
  T data;
  HttpStatus status;
  dynamic error;

  HttpResult.ok(T dataParameter) {
    data = dataParameter;
    status = HttpStatus.Ok;
  }

  HttpResult.created(T dataParameter) {
    data = dataParameter;
    status = HttpStatus.Created;
  }

  HttpResult.error(dynamic dataParameter) {
    data = dataParameter;
    status = HttpStatus.Error;
  }

  HttpResult.badRequest(dynamic dataParameter) {
    data = dataParameter;
    status = HttpStatus.BadRequest;
  }

  HttpResult.notFound() {
    status = HttpStatus.NotFound;
  }
}
