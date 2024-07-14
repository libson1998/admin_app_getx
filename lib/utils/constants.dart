import 'package:adminapp/utils/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF022f3c);
const kPrimaryLightColor = Color(0xFFFFECDF);
const textColor = Colors.black;
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const backgroundColor = Color(0xFFEEEEEE);
const kAnimationDuration = Duration(milliseconds: 200);
const cardColor = Color(0xffffffff);
const String baseUrl = 'https://adminapp.azinovaict.com/api/mobile/';
const String currency = 'QAR ';

// const String baseUrl = 'https://pooz-test.prompttechdemohosting.com/';
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kFirstNameNullError = "Please Enter your first name";
const String kLastNameNullError = "Please Enter your last name";
const String kLastPhoneNullError = "Please Enter your mobile number";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kInvalidPhoneError = "Please Enter Valid phone";
const String kInvalidFirstError = "Please Enter Valid first name";
const String kInvalidLastError = "Please Enter Valid last name";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

class PreferenceConstants {

  PreferenceConstants._();
  static const String hasShownDialog = "hasShownDialog";

  static const String strToken = "STR_TOKEN";
  static const String strFirebaseToken = "STR_FIREBASE_TOKEN";
  static const String strDeviceSession = "strDeviceSession";
  static const String strCartCount = "STR_CART_COUNT";
  static const String strCurrentPosition = "STR_CURRENT_POSITION";
  static const String sessionId = "token";
  static const String blnIsLoggedIn = "BLN_IS_LOGGED_IN";
  static const String blnIsRegisteredIn = "BLN_IS_REGISTERED";
  static const String blnIsInstalled = "BLN_IS_INSTALLED";
  static const String isOTPPending = "BLN_IS_OTP_PENDING";

  static const String oTPPendingEmail = "STR_OTP_PENDING_EMAIL";

  static const String strUniqueID = "STR_UNIQUE_ID";
  static const String intUserID = "STR_USER_ID";
  static const String strUserAddressID = "STR_USER_ADDRESS_ID";
  static const String strUserName = "STR_USER_NAME";
  static const String strUserPhone = "STR_USER_PHONE";
  static const String strUserReferralCode = "STR_USER_REFERRAL_CODE";
  static const String strUserEmail = "STR_USER_EMAIL";
  static const String strUserAddress = "STR_USER_ADDRESS";
  static const String strUserProfilePic = "STR_USER_PROFILE_PIC";
  static const String strUserPasswordCode = "STR_USER_PASSWORD_CODE";
  static const String strUserAnyDeskTeamViewer = "STR_ANY_DESK_TEAM_VIEWER";
  static const String strUserContactPersonName = "STR_USER_CONTACT_PERSON_NAME";

  static const String strDeviceName = "STR_DEVICE_NAME";
  static const String strDeviceModel = "STR_DEVICE_MODEL";
  static const String strOSVersion = "STR_OS_VERSION";
  static const String strAppVersion = "STR_APP_VERSION";
  static const String strMacID = "02:00:00:00:00:00";
  static const String strDeviceID = "STR_DEVICE_ID";
  static const String strAndroidVersion = "STR_ANDROID_VERSION";
  static const String strManufacturer = "STR_MANUFACTURER";
  static const String strPaymentId = "PAYMENT_ID";
  static const String strSubCategoryId = "STR_SUB_CATEGORY_ID";

  static const String strLocaleLanguage = "STR_LOCALE_LANGUAGE";
  static const String strLocaleCountry = "STR_LOCALE_COUNTRY";
  static const String strCurrency = "STR_CURRENCY";
}
