class CustomException implements Exception {
  CustomException();
  CustomException.fromJson(Map<String, dynamic> json);

  @override
  String toString() {
    return 'CustomException';
  }
}
