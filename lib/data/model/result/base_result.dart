class BaseResult {
  final bool success;
  final String message;

  const BaseResult({required this.success, required this.message});

  static BaseResult fromJson(Map<String, dynamic> json) {
    return BaseResult(
      success: json["success"],
      message: json["message"],
    );
  }
}
