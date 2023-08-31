import 'package:booking_flights/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepositories {
  static SharedPreferences globalSharedPreferences = Get.find();

  //!----Keys----
  static String PREF_FIRST_LUNCH = 'first_lunch';
  static String PREF_ISLOGEED = 'first_login';
  static String PREF_MYTRIPS = 'MyTrip';

  void setFirstLunch(bool value) {
    setPreference(dataType: DataType.BOOL, key: PREF_FIRST_LUNCH, value: value);
  }

  bool getFirstLunch() {
    if (globalSharedPreferences.containsKey(PREF_FIRST_LUNCH)) {
      return getPreference(key: PREF_FIRST_LUNCH);
    } else {
      return true;
    }
  }

  void setMyTrips(List<String> value) {
    setPreference(
        dataType: DataType.STRINGLIST, key: PREF_MYTRIPS, value: value);
  }

  List getMyTrips() {
    if (globalSharedPreferences.containsKey(PREF_MYTRIPS)) {
      return getPreference(key: PREF_MYTRIPS);
    } else {
      return [];
    }
  }

  setPreference(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreferences.setStringList(key, value);
        break;
    }
  }

  dynamic getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }

  clearPreference() {
    globalSharedPreferences.clear();
  }
}
