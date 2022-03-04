class ApiDTO<R, E> {
  ApiDTO({
    this.response,
    this.error,
  });

  final R? response;
  final E? error;
}