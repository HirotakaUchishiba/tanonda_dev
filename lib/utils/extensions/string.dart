extension StringExtension on String {
  String ifIsEmpty(String placeholder) => isEmpty ? placeholder : this;

  String truncated(
    int maxLength, {
    String ellipsis = '...',
  }) {
    final length = this.length;
    if (length <= maxLength) {
      return this;
    }
    return '${substring(0, maxLength)}$ellipsis';
  }
}