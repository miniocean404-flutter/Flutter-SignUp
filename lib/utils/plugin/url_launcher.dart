import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  await canLaunchUrl(uri) ? await launchUrl(uri) : throw '不能跳转URL $uri';
}
