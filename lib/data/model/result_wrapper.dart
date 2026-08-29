sealed class Result<T> {
  Result();
}

class Success<T> extends Result<T> {
  final T data;

  Success(this.data);
}

class Error<T> extends Result<T> {
  final Exception error;

  Error(this.error);
}
