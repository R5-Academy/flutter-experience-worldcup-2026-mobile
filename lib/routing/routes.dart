final class Routes._() {
  static const splash = '/splash';
  static const welcome = '/welcome';
  static const login = '/auth/login';
  static const authRegister = '/auth/register';
  static const home = '/home';
  static const album = '/album';
  static const trades = '/trades';
  static const more = '/more';

  static const stickerPath = '/sticker/:code';
  static String sticker(String code) => '/sticker/$code';

  static const stickerRegister = '/sticker/register';

  static const public = {splash, welcome, login, authRegister};
}
