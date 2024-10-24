
const linkImages = 'assets/images/';
class AppImages{
  static String getImages(String name) => '$linkImages${name.replaceAll(' ','').toLowerCase()}';
}