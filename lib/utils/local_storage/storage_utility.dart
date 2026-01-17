import 'package:get_storage/get_storage.dart';

/// كلاس لإدارة التخزين المحلي باستخدام GetStorage
/// يوفّر طرق لقراءة وكتابة البيانات بشكل عام
class TLocalStorage {
  /// كائن GetStorage الخاص بالتخزين
  late final GetStorage _storage;

  /// نسخة واحدة (Singleton) من الكلاس
  static TLocalStorage? _instance;

  /// الكونستركتور الداخلي لمنع إنشاء نسخ متعددة
  TLocalStorage._internal();

  /// إنشاء نسخة من الكلاس (Singleton)
  /// يمكن استخدامه للحصول على نفس النسخة في أي مكان
  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }

  /// تهيئة التخزين بشكل غير متزامن
  /// [bucketName] اسم الحاوية لتخزين البيانات (يسمح بفصل البيانات لمجموعات مختلفة)
  static Future<void> init(String bucketName) async {
    // مهم جدًا عند استخدام Buckets متعددة
    await GetStorage.init(bucketName);

    // إنشاء نسخة من الكلاس وربطها بالحاوية المحددة
    _instance = TLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  /// دالة عامة لحفظ البيانات
  /// [key] اسم المفتاح
  /// [value] القيمة من أي نوع
  Future<void> writeData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  /// دالة عامة لقراءة البيانات
  /// [key] اسم المفتاح
  /// ترجع القيمة من نفس النوع إذا وجدت، أو null إذا لم توجد
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  /// دالة لإزالة قيمة محددة من التخزين
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  /// مسح جميع البيانات في التخزين
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
