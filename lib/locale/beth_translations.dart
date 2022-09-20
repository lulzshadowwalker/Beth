import 'package:beth/helpers/beth_const.dart';
import 'package:get/get.dart';

class BethTranslations extends Translations {
  /// returns a map of all the currently supported locales and their corresponding names
  static Map<String, String> get languages => {
        englishLanguageKey: english,
        arabicLanguageKey: arabic,
      };

  /// returns the language code of the current locale
  static String? get currentLanguageCode => Get.locale?.languageCode;

  static const String english = 'English';
  static const String englishLanguageKey = 'en';
  static const String arabic = 'العربية';
  static const String arabicLanguageKey = 'ar';

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
  static const String signInWithApple = 'signInWithApple';
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
  static const String step2of2 = 'step2of2';
  static const String signUpWithApple = 'signUpWithApple';
  static const String home = 'home';
  static const String discover = 'discover';
  static const String communityWall = 'communityWall';
  static const String settings = 'settings';
  static const String bugReport = 'bugReport';
  static const String logout = 'logout';
  static const String profilePicture = 'profilePicture';
  static const String language = 'language';
  static const String theme = 'theme';
  static const String accountSettings = 'accountSettings';
  static const String appSettings = 'appSettings';
  static const String developerNotice = 'developerNotice';
  static const String attributions = 'attributions';
  static const String dark = 'dark';
  static const String light = 'light';
  static const String nameUpdatedSuccessfully = 'nameUpdatedSuccessfully';
  static const String emailUpdatedSuccessfully = 'emailUpdatedSuccessfully';
  static const String enterYourNewEmailAddress = 'enterYourNewEmailAddress';
  static const String enterYourNewName = 'enterYourNewName';
  static const String applyChanges = 'applyChanges';
  static const String noImageSelected = 'noImageSelected';
  static const String submitABug = 'submitABug';
  static const String subject = 'subject';
  static const String descriptionOptional = 'descriptionOptional';
  static const String description = 'description';
  static const String subjectMustBeProvided = 'subjectMustBeProvided';
  static const String submit = 'submit';
  static const String attachScreenshot = 'attachScreenshot';
  static const String tyForSubmitting = 'tyForSubmitting';
  static const String tellUsMore = 'tellUsMore';
  static const String postToCommunity = 'postToCommunity';
  static const String post = 'post';
  static const String postAddedSuccessfully = 'postAddedSuccessfully';
  static const String popular = 'popular';
  static const String feed = 'feed';
  static const String haventAddedItems = 'haventAddedItems';
  static const String bookmarks = 'bookmarks';
  static const String unauthenticEmail = 'unauthenticEmail';
  static const String bethWonders = 'bethWonders';
  static const String showOnMap = 'showOnMap';
  static const String cancel = 'cancel';
  static const String exploreBethWonders = 'exploreBethWonders';
  static const String joinTheCommunity = 'joinTheCommunity';
  static const String bethArbel = 'bethArbel';
  static const String accessBookmarksAnywhere = 'cloudSyncedBookmarks';
  static const String arabella = 'arabella';
  static const String irbid = 'irbid';
  static const String beautyAndCulture = 'beautyAndCulture';
  static const String continueToBeth = 'continueToBeth';
  /* -------------------------------------------------------------------------- */

  /* [FirebaseAuthException] codes -------------------------------------------- */
  static const String userNotFound = 'user-not-found';
  static const String wrongPassword = 'wrong-password';
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String weakPassword = 'weak-password';
  static const String authUserNotFound = 'auth/user-not-found';
  static const String networkRequestFailed = 'network-request-failed';
  static const String requiresRecenetLogin = 'requires-recent-login';
  /* -------------------------------------------------------------------------- */

  /* SHARED VALUES ------------------------------------------------------------ */
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
          signInWithApple: 'Sign in with Apple',
          signUpWithApple: 'Sign up with Apple',
          dontHaveAnAccount: 'dont have an account?',
          signUp: 'Sign up',
          passwordInvalid: 'letters, numbers, and symbols (8 chars min)',
          emailInvalid: 'email format is invalid',
          passwordResetEmail: 'Passwrod-reset email has been sent',
          signInWithGoogle: 'Sign in with Google',
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
          step2of2: 'Step 2 of 2',
          home: 'home',
          discover: 'discover',
          communityWall: 'Community\nwall',
          settings: 'settings',
          bugReport: 'bug report',
          logout: 'logout',
          profilePicture: 'profile picture',
          language: 'language',
          theme: 'theme',
          accountSettings: 'Account Settings',
          appSettings: 'App Settings',
          developerNotice: 'Developer Notice',
          attributions: 'attributions',
          dark: 'dark',
          light: 'light',
          nameUpdatedSuccessfully: 'name updated successfully',
          emailUpdatedSuccessfully: 'email updated successfully',
          enterYourNewEmailAddress: 'enter your new email address',
          enterYourNewName: 'enter your new name',
          applyChanges: 'apply changes',
          requiresRecenetLogin: 'you need to log in again to proceed',
          BethConst.systemDefault: 'system default',
          noImageSelected: 'no image selected',
          submitABug: 'Submit a bug',
          subject: 'subject',
          descriptionOptional: 'description ( optional )',
          description: 'description',
          subjectMustBeProvided: 'subject must be provided',
          submit: 'submit',
          attachScreenshot: 'attach a screenshot',
          tyForSubmitting: 'Thank you for submitting',
          tellUsMore: 'tell us more',
          postToCommunity: 'Post to community',
          post: 'post',
          postAddedSuccessfully: 'post added successfully',
          popular: 'Popular',
          feed: 'Feed',
          haventAddedItems: 'Bookmark items to show up here',
          bookmarks: 'bookmarks',
          unauthenticEmail: 'please use an active email',
          bethWonders: 'the wonders of Beth-arbel',
          showOnMap: 'show on map',
          cancel: 'cancel',
          exploreBethWonders: 'explore the wonders of Beth-arbel',
          joinTheCommunity: 'Be a part of the beth community',
          bethArbel: 'Beth-arbel',
          arabella: 'Arabella',
          irbid: 'Irbid',
          beautyAndCulture: 'ancient beauty and a modern captial of culture.',
          accessBookmarksAnywhere: 'access your bookmarks from any device!',
          continueToBeth: 'continue to Beth',
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
          signInWithApple: 'تسجيل الدخول مع آبل',
          signUpWithApple: 'تسجيل مستخدم جديد مع آبل',
          dontHaveAnAccount: 'ليس لديك حساب؟',
          signUp: 'إنشاء حساب',
          passwordInvalid: '(8 خانات على الأقل) أحرف أرقام ورموز',
          emailInvalid: 'صيغة البريد الإلكتروني غير صحيحة',
          passwordResetEmail: 'تم إرسال بريد إلكتروني لتغيير كلمة المرور',
          signInWithGoogle: 'تسجيل الدخول مع غووغل',
          signUpWithGoogle: 'تسجيل مستخدم جديد مع غووغل',
          alreadyHaveAnAccount: 'لديك حساب مسبقًا؟',
          name: 'الاسم',
          nameInvalid: 'يجب أن يكون الاسم 3-12 خانة',
          networkRequestFailed: arCheckInternet,
          enterYourEmailAddress: 'قم بإدخال\nبريدك الإلكتروني.',
          sendPasswordResetEmail: 'إرسال رابط تغيير كلمة المرور',
          gallery: 'الألبوم',
          camera: 'الكاميرا',
          pickImage: 'اختيار صورة',
          step2of2: 'خطوة ٢ من ٢',
          home: 'الصفحة الرئيسة',
          discover: 'استكشف',
          communityWall: 'المجتمع',
          settings: 'الإعدادات',
          bugReport: 'تبليغ خلل',
          logout: 'تسجيل الخروج',
          profilePicture: 'الصورة الشخصية',
          language: 'اللغة',
          theme: 'المظهر',
          accountSettings: 'إعدادات الحساب',
          appSettings: 'إعدادات التطبيق',
          developerNotice: 'ملحوظة المطور',
          attributions: 'الإسناد',
          dark: 'داكن',
          light: 'ساطع',
          nameUpdatedSuccessfully: 'تم تغيير الاسم بنجاح',
          emailUpdatedSuccessfully: 'تم تغيير البريد الإلكتروني بنجاح',
          enterYourNewEmailAddress: 'أدخل بريدك الإلكتروني الجديد',
          enterYourNewName: 'أدخل الاسم الجديد',
          applyChanges: 'تأكيد التغيير',
          requiresRecenetLogin: 'تلزم إعادة تسجيل الدخول للمتابعة',
          BethConst.systemDefault: 'افتراضي النظام',
          noImageSelected: 'لم يتم اختيار صورة',
          submitABug: 'أرسل تقرير عن الخلل',
          subject: 'العنوان',
          descriptionOptional: 'الوصف ( اختياري )',
          description: 'الوصف',
          subjectMustBeProvided: 'يجب إضافة عنوان',
          submit: 'إرسال',
          attachScreenshot: 'إرفاق صورة للشاشة',
          tyForSubmitting: 'شكرا على التبليغ',
          tellUsMore: 'اخبرنا المزيد',
          postToCommunity: 'انشر إلى المجتمع',
          post: 'انشر',
          postAddedSuccessfully: 'تم إضافة المنشور بنجاح',
          popular: 'الأكثر رواجًا',
          feed: 'المنشورات',
          haventAddedItems: 'احفظ عناصر لكي تظهر هنا',
          bookmarks: 'المحفوظات',
          unauthenticEmail: 'يرجى استخدام بريد الكتروني فعال',
          bethWonders: 'خبايا أرابيلا',
          showOnMap: 'أظهر على الخريطة',
          cancel: 'إلغاء',
          exploreBethWonders: 'استكشف خبايا أرابيلا',
          joinTheCommunity: 'انضم إلى مجتمعنا',
          bethArbel: 'بيث-أرابيل',
          arabella: 'أرابيلا',
          irbid: 'إربد',
          beautyAndCulture: 'عريقة الجمال وعاصمة الثقافة المعاصرة',
          accessBookmarksAnywhere: 'يمكنك الوصول إلى محفوظاتك عبر جميع الأجهزة',
          continueToBeth: 'الاستمرار',
        },
        /* -------------------------------------------------------------------------- */
      };
}
