

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TDeviceUtils {
  
  /// إخفاء لوحة المفاتيح من الشاشة
  /// [context] سياق الواجهة الحالي
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// تغيير لون شريط الحالة (Status Bar)
  /// [color] اللون المطلوب لشريط الحالة
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// التحقق من أن الجهاز في وضع أفقي (Landscape)
  /// [context] سياق الواجهة الحالي
  /// Returns: true إذا كان الجهاز في وضع أفقي
  static bool isLandscapeOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// التحقق من أن الجهاز في وضع عمودي (Portrait)
  /// [context] سياق الواجهة الحالي
  /// Returns: true إذا كان الجهاز في وضع عمودي
  static bool isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  /// تفعيل أو إلغاء وضع ملء الشاشة (Full Screen)
  /// [enable] true لتفعيل ملء الشاشة، false لإلغائه
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge
    );
  }

  /// الحصول على ارتفاع الشاشة بالبكسل
  /// Returns: ارتفاع الشاشة
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// الحصول على عرض الشاشة بالبكسل
  /// [context] سياق الواجهة الحالي
  /// Returns: عرض الشاشة
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// الحصول على نسبة البكسل للجهاز (Pixel Ratio)
  /// Returns: نسبة البكسل
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  /// الحصول على ارتفاع شريط الحالة (Status Bar)
  /// Returns: ارتفاع شريط الحالة بالبكسل
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  /// الحصول على ارتفاع شريط التنقل السفلي الافتراضي
  /// Returns: ارتفاع شريط التنقل السفلي
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// الحصول على ارتفاع شريط التطبيق (App Bar) الافتراضي
  /// Returns: ارتفاع شريط التطبيق
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// الحصول على ارتفاع لوحة المفاتيح عندما تكون ظاهرة
  /// Returns: ارتفاع لوحة المفاتيح بالبكسل
  static double getKeyboardHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  /// التحقق من أن لوحة المفاتيح مرئية حالياً
  /// Returns: true إذا كانت لوحة المفاتيح ظاهرة
  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  /// التحقق من أن التطبيق يعمل على جهاز فعلي (وليس متصفح)
  /// Returns: true إذا كان جهاز Android أو iOS
  static Future<bool> isPhysicalDevice() async {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.android || 
           defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// تفعيل الاهتزاز (Vibration) للجهاز
  /// [duration] مدة الاهتزاز
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// تحديد الاتجاهات المسموح بها للشاشة
  /// [orientations] قائمة باتجاهات الشاشة المسموح بها
  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// إخفاء شريط الحالة (Status Bar)
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// إظهار شريط الحالة (Status Bar)
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual, 
      overlays: SystemUiOverlay.values
    );
  }

  /// التحقق من وجود اتصال بالإنترنت
  /// Returns: true إذا كان هناك اتصال بالإنترنت
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// التحقق من أن المنصة هي iOS
  /// Returns: true إذا كان الجهاز يعمل بنظام iOS
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// التحقق من أن المنصة هي Android
  /// Returns: true إذا كان الجهاز يعمل بنظام Android
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// فتح رابط URL في المتصفح
  /// [address] عنوان الموقع المراد فتحه
    static void launchWebsiteUrl(String address) async {
    final Uri url = Uri.parse(address);
    if (!await launchUrl(url)) {
      if (kDebugMode) print('Could not launch $url');
    }
  }
}