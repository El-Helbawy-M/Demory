import 'package:shared_preferences/shared_preferences.dart';

//==================================== Fields
SharedPreferences pref;
//==================================== End

//==================================== Functions
linkCache() async => pref = await SharedPreferences.getInstance();

Future<bool> register(String name) async {
  bool check = false;
  check = await pref.setString("name", name);
  check = await pref.setString("avatar", '');
  return check;
}

Future<bool> signOut() async => await pref.clear();

saveMod(String mod) async {
  SharedPreferences modPref = await SharedPreferences.getInstance();
  await modPref.setString('Mod', mod);
}

Future<String> getSavedMod() async {
  SharedPreferences modPref = await SharedPreferences.getInstance();
  bool check = modPref.containsKey('Mod');
  return (check) ? modPref.getString('Mod') : '';
}
//==================================== End

//==================================== Getter
bool get containName => pref.containsKey("name");
String get name => pref.getString("name");
String get avatar => pref.getString("avatar");
//==================================== End

//==================================== Setter
set setAvatar(String val) => pref.setString('avatar', val);
