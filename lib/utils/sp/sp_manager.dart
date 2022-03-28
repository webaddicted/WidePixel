import 'package:widepixelimage/data/bean/UpdateProfileReq.dart';
import 'package:widepixelimage/utils/constant/PrefConst.dart';
import 'package:widepixelimage/utils/sp/sp_helper.dart';

class SPManager {
  static void setUserInfo<T>(UpdateProfileReq user) async {
    SPHelper.setPreference(
        PrefConst.PREF_CUSTOMER_ID, user.customerId.toString());
    SPHelper.setPreference(PrefConst.PREF_NAME, user.name);
    SPHelper.setPreference(PrefConst.PREF_EMAIL, user.email);
    SPHelper.setPreference(PrefConst.PREF_DOB, user.dob);
    SPHelper.setPreference(PrefConst.PREF_MOBILE, user.mobile);
    SPHelper.setPreference(PrefConst.PREF_ADDRESS, user.address);
    SPHelper.setPreference(PrefConst.PREF_IMAGE, user.customerImage);
  }

  static Future<UpdateProfileReq> getUserInfo<T>() async {
    var customerId =
        await SPHelper.getPreference(PrefConst.PREF_CUSTOMER_ID, "");
    var name = await SPHelper.getPreference(PrefConst.PREF_NAME, "");
    var email = await SPHelper.getPreference(PrefConst.PREF_EMAIL, "");
    var dob = await SPHelper.getPreference(PrefConst.PREF_DOB, "");
    var mobile = await SPHelper.getPreference(PrefConst.PREF_MOBILE, "");
    var address = await SPHelper.getPreference(PrefConst.PREF_ADDRESS, "");
    var image = await SPHelper.getPreference(PrefConst.PREF_IMAGE, "");
    var userInfo = UpdateProfileReq(
        customerId, name, email, dob, mobile, address, image, '', '');
    return userInfo;
  }

  static Future<String> getCustomerId<T>() async {
    var spValue = await SPHelper.getPreference(PrefConst.PREF_CUSTOMER_ID, "");
    return spValue;
  }

  static void setAccessToken<T>(String token) {
    SPHelper.setPreference(PrefConst.PREF_ACCESS_TOKEN, token);
  }

  static Future<String> getAccessToken<T>() async {
    var spValue = await SPHelper.getPreference(PrefConst.PREF_ACCESS_TOKEN, "");
    return spValue;
  }

  static Future<Set<String>> getAllKeys() async {
    var spValue = await SPHelper.getAllKeys();
    return spValue;
  }

  static Future<bool> removeKeys(String key) async {
    var spValue = await SPHelper.removeKey(key);
    return spValue;
  }

  static Future<bool> clearPref() async {
    var spValue = await SPHelper.clearPreference();
    return spValue;
  }
}
