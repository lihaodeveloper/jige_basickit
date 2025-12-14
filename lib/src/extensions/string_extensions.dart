extension StringValidations on String? {
  /// 判断：非null 且 不是空字符串（""）
  bool get isNotNullAndNotEmpty {
    return this != null && this!.isNotEmpty;
  }

  /// 判断：是null 或 空字符串（""）
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}
