import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';

class AppPref {
  AppPref._();

  static final GetStorage _box = GetStorage('AppPref');

  static final BehaviorSubject _userBehavior = BehaviorSubject<dynamic>();

  static initListener() async {
    await GetStorage.init("AppPref");
    _box.listenKey('user', (user) {
      _userBehavior.add(user);
    });
  }

  static set accessToken(String? token) => _box.write('accessToken', token);
  static set firstInstallAppWrireIsNull(int? number) =>
      _box.writeIfNull('firstInstall', number);

  static set firstInstallApp(int? number) => _box.write('firstInstall', number);
  static set firstName(String? firstName) => _box.write('firstName', firstName);
  static set lastName(String? lastName) => _box.write('lastName', lastName);
  static set email(String? email) => _box.write('email', email);
  static set password(String? password) => _box.write('password', password);

  static String? get accessToken => _box.read('accessToken');
  static String? get lastName => _box.read('firstName');
  static String? get firstName => _box.read('lastName');
  static String? get email => _box.read('email');
  static String? get password => _box.read('password');
  static int? get firstInstallApp => _box.read('firstInstall');

  // static set user(Apps? _user) {
  //   _box.write('user', _user);
  // }
  //
  // static Apps? get user {
  //   final _ = _box.read('user');
  //   if (_ == null) return null;
  //   return _ is Apps ? _ : Apps.fromJson(_box.read('user'));
  // }

  static Stream get watchUser => _userBehavior.stream;
}
