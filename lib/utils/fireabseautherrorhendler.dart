import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthErrorHandler {
  static String getMessage(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح.';
      case 'user-disabled':
        return 'تم تعطيل هذا المستخدم.';
      case 'user-not-found':
        return 'المستخدم غير موجود.';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة.';
      case 'email-already-in-use':
        return 'البريد الإلكتروني مستخدم بالفعل.';
      case 'operation-not-allowed':
        return 'هذا النوع من الحسابات غير مسموح به.';
      case 'weak-password':
        return 'كلمة المرور ضعيفة. اختر كلمة أقوى.';
      case 'too-many-requests':
        return 'عدد كبير من المحاولات. يرجى المحاولة لاحقاً.';
      case 'network-request-failed':
        return 'فشل الاتصال بالإنترنت.';
      default:
        return 'حدث خطأ غير متوقع: ${exception.message}';
    }
  }
}
