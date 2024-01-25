import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLogger {
  checkStorage({required String key, required Logger logger}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.get(key);
    if (temp == null) {
      logger.e('The value was not saved');
    } else {
      logger.i('The value has been saved');
    }
  }

  checkFetch(
      {required String key, required var value, required Logger logger}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = prefs.get(key);
    if (temp == value) {
      logger.i('The value has been changed');
    } else {
      logger.e('The value was not changed');
    }
  }
}
