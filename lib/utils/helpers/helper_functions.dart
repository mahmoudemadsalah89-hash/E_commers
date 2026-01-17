import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// دوال مساعدة للعمليات الشائعة في التطبيق
class THelperFunctions {
  // منع إنشاء كائن من الكلاس
  THelperFunctions._();

  /// خريطة الألوان المدعومة
  static const Map<String, Color> _colorMap = {
    'green': Colors.green,
    'red': Colors.red,
    'blue': Colors.blue,
    'pink': Colors.pink,
    'grey': Colors.grey,
    'purple': Colors.purple,
    'black': Colors.black,
    'white': Colors.white,
    'yellow': Colors.yellow,
    'orange': Colors.deepOrange,
    'brown': Colors.brown,
    'teal': Colors.teal,
    'indigo': Colors.indigo,
  };

  /// تحويل اسم اللون إلى Color
  static Color? getColor(String value) {
    return _colorMap[value.toLowerCase()];
  }

  /// ارتفاع المنطقة الآمنة العلوية
  static double getTopSafeArea(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top;
  }

  /// المنطقة الآمنة السفلية
  static double getBottomSafeArea(BuildContext context) {
    return MediaQuery.of(context).viewPadding.bottom;
  }

  /// عرض SnackBar
  static void showSnackBar(String message) {
    final context = Get.context;
    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// عرض AlertDialog
  static void showAlert(String title, String message) {
    final context = Get.context;
    if (context == null) return;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// الانتقال إلى شاشة جديدة
  static Future<void> navigateToScreen(
    BuildContext context,
    Widget screen,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// اقتطاع النص
  static String truncateText(String text, int maxLength) {
    return text.length <= maxLength
        ? text
        : '${text.substring(0, maxLength)}...';
  }

  /// التحقق من الوضع الداكن
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// التحقق من الوضع الطولي
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  /// حجم الشاشة
  static Size screenSize() {
    final context = Get.context;
    return context == null ? Size.zero : MediaQuery.of(context).size;
  }

  static double screenHeight() => screenSize().height;

  static double screenWidth() => screenSize().width;

  /// تنسيق التاريخ
  static String getFormattedDate(
    DateTime date, {
    String format = 'dd MMM yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  /// إزالة التكرار من القائمة
  static List<T> removeDuplicates<T>(List<T> list) {
    return List<T>.from(list.toSet());
  }

  /// تجميع الويدجت في صفوف
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    if (rowSize <= 0) return [];

    return List.generate(
      (widgets.length / rowSize).ceil(),
      (index) {
        final start = index * rowSize;
        final end = min(start + rowSize, widgets.length);
        return Row(children: widgets.sublist(start, end));
      },
    );
  }

  /// إخفاء رقم الهاتف
  static String maskPhoneNumber(String number) {
    final digits = number.replaceAll(RegExp(r'\D'), '');

    if (digits.length <= 6) return digits;

    final start = digits.substring(0, 2);
    final end = digits.substring(digits.length - 3);
    return '$start${'*' * (digits.length - 5)}$end';
  }

  /// توليد كود إحالة
  static String generateReferralCode(String firstName) {
    if (firstName.trim().isEmpty) return '';

    final randomNumber = Random().nextInt(9000) + 1000;
    return '${firstName.trim().toUpperCase()}$randomNumber';
  }

  /// تحويل قيمة إلى DateTime
  static DateTime? convertToDateTime(dynamic value) {
    if (value == null) return null;

    if (value is DateTime) return value;

    if (value is String) {
      return DateTime.tryParse(value);
    }

    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    }

    if (value is double) {
      return DateTime.fromMillisecondsSinceEpoch(value.toInt());
    }

    // Firestore Timestamp (بشكل آمن)
    try {
      final dynamic date = value.toDate();
      if (date is DateTime) return date;
    } catch (_) {}

    return null;
  }

  /// تنسيق المسافة
  static String formatDistance(int meters) {
    if (meters <= 0) return '0 م';

    if (meters < 1000) {
      return '$meters م';
    }

    return '${(meters / 1000).toStringAsFixed(1)} كم';
  }

  /// حساب العمر
  static int calculateAge(String formattedDate) {
    try {
      final birthDate =
          DateFormat('dd-MMM-yyyy').parseStrict(formattedDate);
      final now = DateTime.now();

      int age = now.year - birthDate.year;
      if (now.month < birthDate.month ||
          (now.month == birthDate.month &&
              now.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (_) {
      return 0;
    }
  }
}
