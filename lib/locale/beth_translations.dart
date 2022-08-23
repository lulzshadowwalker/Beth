import 'package:get/get_navigation/src/root/internacionalization.dart';

class BethTranslations extends Translations {
  /* KEYS --------------------------------------------------------------------- */
  static const String error = 'failure';
  static const String checkInternetConnection = 'checkInternetConnection';
  static const String success = 'success';
  static const String info = 'help';
  static const String warning = 'warning';
  static const String unkownError = 'unkownError';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String email = 'email';
  static const String password = 'password';
  static const String passwordHintText = 'passwordHintText';
  static const String forgotPassword = 'forgotPassword';
  static const String or = 'or';
  static const String signInWithGoogle = 'signInWithGoogle';
  static const String signUpWithGoogle = 'signUpWithGoogle';
  static const String dontHaveAnAccount = 'dontHaveAnAccount';
  static const String passwordInvalid = 'passwordInvalid';
  static const String emailInvalid = 'emailInvalid';
  static const String passwordResetEmail = 'passwordResetEmail';
  static const String alreadyHaveAnAccount = 'alreadyHaveAnAccount';
  static const String name = 'name';
  static const String nameInvalid = 'nameInvalid';
  static const String enterYourEmailAddress = 'enterYourEmailAddress';
  static const String sendPasswordResetEmail = 'sendPasswordResetEmail';
  static const String gallery = 'gallery';
  static const String camera = 'camera';
  static const String pickImage = 'uploadImage';
  /* -------------------------------------------------------------------------- */

  /* [FirebaseAuthException] codes -------------------------------------------- */
  static const String userNotFound = 'user-not-found';
  static const String wrongPassword = 'wrong-password';
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String weakPassword = 'weak-password';
  static const String authUserNotFound = 'auth/user-not-found';
  static const String networkRequestFailed = 'network-request-failed';
  /* -------------------------------------------------------------------------- */

  /* SHARED ------------------------------------------------------------------- */
  //
  static const String enCheckInternet = 'Check internet connection';
  static const String arCheckInternet = 'تحقق من الاتصال بالانترنت';

  /* -------------------------------------------------------------------------- */

  @override
  Map<String, Map<String, String>> get keys => {
        /* ENGLISH LOCALE ----------------------------------------------------------- */
        'en': {
          error: 'Oh Snap!',
          checkInternetConnection: enCheckInternet,
          success: 'Success!',
          warning: 'Warning!',
          info: 'Hi There!',
          unkownError: 'Unknown error has occurred',
          userNotFound: 'User not found',
          wrongPassword: 'Password incorrect',
          emailAlreadyInUse: 'Email already in use',
          weakPassword: 'Pick a stronger password',
          authUserNotFound: 'No user associated with the given email',
          signIn: 'Sign in',
          email: 'email',
          password: 'password',
          passwordHintText: 'letters, numbers, and symbols',
          forgotPassword: 'forgot password?',
          or: 'or',
          signInWithGoogle: 'Sign in with Google',
          dontHaveAnAccount: 'dont have an account?',
          signUp: 'Sign up',
          passwordInvalid: 'letters, numbers, and symbols (8 chars min)',
          emailInvalid: 'email format is invalid',
          passwordResetEmail: 'Passwrod-reset email has been sent',
          signUpWithGoogle: 'Sign up with Google',
          alreadyHaveAnAccount: 'already have an account?',
          name: 'name',
          nameInvalid: 'name must be 3-12 characters long',
          networkRequestFailed: enCheckInternet,
          enterYourEmailAddress: 'enter your\nemail address.',
          sendPasswordResetEmail: 'Send password reset email',
          gallery: 'gallery',
          camera: 'camera',
          pickImage: 'Pick an image',
        },
        /* -------------------------------------------------------------------------- */

        /* ARABIC LOCALE ------------------------------------------------------------ */
        'ar': {
          error: 'حصل خطأ',
          checkInternetConnection: arCheckInternet,
          success: 'نجاح',
          warning: 'تحذير',
          info: 'مرحبا',
          unkownError: 'حصل خطأ غير متوقع',
          userNotFound: 'لم يتم العثور على المستخدم',
          wrongPassword: 'كلمة المرور غير صحيحة',
          emailAlreadyInUse: 'البريد الإلكتروني قيد الاستخدام',
          weakPassword: 'قم بإدخال كلمة سر أكثر تعقيدًا',
          authUserNotFound: 'البريد الإلكتروني غير مرتبط بمستخدم مسجل سابقًا',
          signIn: 'تسجيل الدخول',
          email: 'البريد الإلكتروني',
          password: 'كلمة السر',
          passwordHintText: 'أحرف أرقام ورموز',
          forgotPassword: 'نسيت كلمة المرور؟',
          or: 'أو',
          signInWithGoogle: 'تسجيل الدخول مع جوجل',
          dontHaveAnAccount: 'ليس لديك حساب؟',
          signUp: 'إنشاء حساب',
          passwordInvalid: '(8 خانات على الأقل) أحرف أرقام ورموز',
          emailInvalid: 'صيغة البريد الإلكتروني غير صحيحة',
          passwordResetEmail: 'تم إرسال بريد إلكتروني لتغيير كلمة المرور',
          signUpWithGoogle: 'تسجيل مستخدم جديد مع جوجل',
          alreadyHaveAnAccount: 'لديك حساب مسبقًا؟',
          name: 'الاسم',
          nameInvalid: 'يجب أن يكون الاسم 3-12 خانة',
          networkRequestFailed: arCheckInternet,
          enterYourEmailAddress: 'قم بإدخال\nبريدك الإلكتروني.',
          sendPasswordResetEmail: 'إرسال رابط تغيير كلمة المرور',
          gallery: 'الألبوم',
          camera: 'الكاميرا',
          pickImage: 'اختيار صورة',
        },
        /* -------------------------------------------------------------------------- */
      };
}
