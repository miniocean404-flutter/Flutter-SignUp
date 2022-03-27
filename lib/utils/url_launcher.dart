import 'package:url_launcher/url_launcher.dart';

void launchURL(String _url) async {
  await canLaunch(_url) ? await launch(_url) : throw '不能跳转URL $_url';
}
