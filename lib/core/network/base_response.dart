class BaseResponse<T> {
  final String resultCode;
  final T? data;

  BaseResponse({required this.resultCode, this.data});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return BaseResponse<T>(
      resultCode: json['resultCode'] ?? '',
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  bool get isSuccess => resultCode == 'OK';

  /// 성공이 아닐 경우 예외 발생
  void ensureSuccess() {
    if (!isSuccess) {
      throw Exception('API failed: $resultCode');
    }
  }
}
