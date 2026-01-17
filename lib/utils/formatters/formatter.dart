import 'package:intl/intl.dart';

class TFormatter {
  TFormatter._(); // منع إنشاء object من الكلاس

  /// =========================
  /// 📅 Date & Time Formatting
  /// =========================

  static String formatDateAndTime(
    DateTime? date, {
    bool use24HourFormat = false,
  }) {
    final currentDate = date ?? DateTime.now();

    final dateFormatter = DateFormat('dd/MM/yyyy');
    final timeFormatter =
        DateFormat(use24HourFormat ? 'HH:mm' : 'hh:mm a');

    return '${dateFormatter.format(currentDate)} '
           'at ${timeFormatter.format(currentDate)}';
  }

  static String formatDate(DateTime? date) {
    final currentDate = date ?? DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(currentDate);
  }

  /// =========================
  /// 💰 Currency Formatting
  /// =========================

  static String formatCurrency(
    num amount, {
    String locale = 'ar_EG',
    String symbol = 'ج.م',
  }) {
    return NumberFormat.currency(
      locale: locale,
      symbol: symbol,
    ).format(amount);
  }

  /// =========================
  /// 📞 Phone Number Formatting
  /// =========================

  /// تنسيق رقم مصري افتراضي
  static String formatEgyptPhoneNumber(String phone) {
    final digits = _digitsOnly(phone);

    if (digits.length != 11) return phone;

    return '${digits.substring(0, 3)} '
           '${digits.substring(3, 7)} '
           '${digits.substring(7)}';
  }

  /// تنسيق رقم دولي عام
  static String formatInternationalPhoneNumber(
    String phone, {
    int countryCodeLength = 2,
  }) {
    final digits = _digitsOnly(phone);

    if (digits.length <= countryCodeLength) return phone;

    final countryCode = '+${digits.substring(0, countryCodeLength)}';
    final number = digits.substring(countryCodeLength);

    final buffer = StringBuffer('($countryCode) ');

    for (int i = 0; i < number.length; i += 2) {
      final end = (i + 2 < number.length) ? i + 2 : number.length;
      buffer.write(number.substring(i, end));
      if (end < number.length) buffer.write(' ');
    }

    return buffer.toString();
  }

  /// دمج كود الدولة مع الرقم
  static String formatPhoneWithCountryCode(
    String countryCode,
    String phoneNumber,
  ) {
    final digits = _digitsOnly(phoneNumber);
    return '$countryCode$digits';
  }

  /// =========================
  /// 🔒 Helpers
  /// =========================

  static String _digitsOnly(String value) {
    return value.replaceAll(RegExp(r'\D'), '');
  }
}
