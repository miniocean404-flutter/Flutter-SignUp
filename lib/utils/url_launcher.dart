import 'package:url_launcher/url_launcher.dart';

void launchURL(String _url) async {
  final Uri url = Uri.parse(_url);
  await canLaunchUrl(url) ? await launchUrl(url) : throw '不能跳转URL $url';
}
