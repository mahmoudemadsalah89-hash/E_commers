import 'package:intl/intl.dart';
import 'package:t_stroy/utils/contents/text_strings.dart';

/// كلاس يحتوي على دوال للتحقق من صحة البيانات (Validation)
class TValidator {
  /// التحقق من الحقول الفارغة
  /// [fieldName]: اسم الحقل الذي يظهر في رسالة الخطأ
  /// [value]: القيمة المراد التحقق منها
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.'; // الحقل مطلوب
    }
    return null; // الحقل صالح
  }

  /// التحقق من رمز PIN
  static String? validatePinCode(String? pinCode) {
    if (pinCode == null || pinCode.isEmpty) {
      return 'Pin Code is required.'; // الرمز مطلوب
    }

    // التحقق من طول الرمز
    if (pinCode.length < 6) {
      return 'Pin Code must be 6 Digits.'; // يجب أن يتكون الرمز من 6 أرقام
    }

    return null; // الرمز صالح
  }

  /// التحقق من العمر بناءً على تاريخ الميلاد
  static String? validateAge(String? input) {
    if (input == null || input.isEmpty) {
      return 'Date of Birth is required.'; // تاريخ الميلاد مطلوب
    }

    try {
      // تحليل التاريخ بالصيغة 'dd-MMM-yyyy'
      final DateFormat format = DateFormat('dd-MMM-yyyy');
      final DateTime dateOfBirth = format.parse(input);

      final DateTime today = DateTime.now();
      final int age =
          today.year - dateOfBirth.year - ((today.month < dateOfBirth.month || (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) ? 1 : 0);

      if (age < 18) {
        return TTexts.dateOfBirthError; // العمر أقل من 18 سنة
      }
    } catch (e) {
      return 'Invalid date format. Use dd-MMM-yyyy.'; // صيغة التاريخ غير صحيحة
    }

    return null; // العمر صالح
  }

  /// التحقق من اسم المستخدم
  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required.'; // اسم المستخدم مطلوب
    }

    // نمط الاسم: 3-20 حرف/رقم أو _ أو -
    const pattern = r"^[a-zA-Z0-9_-]{3,20}$";
    final regex = RegExp(pattern);

    bool isValid = regex.hasMatch(username);

    // التأكد أن الاسم لا يبدأ أو ينتهي بـ _ أو -
    if (isValid) {
      isValid = !username.startsWith('_') && !username.startsWith('-') && !username.endsWith('_') && !username.endsWith('-');
    }

    if (!isValid) {
      return 'Username is not valid.'; // الاسم غير صالح
    }

    return null; // الاسم صالح
  }

  /// التحقق من البريد الإلكتروني
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.'; // البريد مطلوب
    }

    // تعبير عادي للتحقق من البريد الإلكتروني
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.'; // البريد غير صالح
    }

    return null; // البريد صالح
  }

  /// التحقق من كلمة المرور
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.'; // كلمة المرور مطلوبة
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long.'; // الحد الأدنى 6 أحرف
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.'; // يجب أن تحتوي على حرف كبير
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.'; // يجب أن تحتوي على رقم
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.'; // يجب أن تحتوي على رمز خاص
    }

    return null; // كلمة المرور صالحة
  }

  /// التحقق من رقم الهاتف
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.'; // رقم الهاتف مطلوب
    }

    final returnValue = validatePhoneNumberFormat(value);

    return returnValue;
  }

  /// التحقق من صيغة رقم الهاتف
  /// (مثال: رقم مكون من 10 أرقام)
  static String? validatePhoneNumberFormat(String? value) {
    if (value == null || value.isEmpty) {
      return null; // لا شيء لفحصه
    }

    final phoneRegExp = RegExp(r'^\d{10}$'); // صيغة الهاتف 10 أرقام

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).'; // صيغة الهاتف غير صحيحة
    }

    return null; // رقم الهاتف صالح
  }

  // يمكن إضافة المزيد من الدوال حسب احتياجات المشروع
}
