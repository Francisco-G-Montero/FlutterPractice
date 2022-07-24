abstract class DataResult2<T> {
  final T? data;
  final String? error;

  const DataResult2({this.data, this.error});
}

class ResultSuccess<T> extends DataResult2<T> {
  const ResultSuccess(T data) : super(data: data);
}

class ResultError<T> extends DataResult2<T> {
  const ResultError(String error) : super(error: error);
}
