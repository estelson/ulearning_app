import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences singleton class.
class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }
}