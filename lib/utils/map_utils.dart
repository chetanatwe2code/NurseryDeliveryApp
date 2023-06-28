import 'package:url_launcher/url_launcher.dart';

class UriLaunchUtils {
  UriLaunchUtils._();
  static Future<void> openMap(double? latitude, double? longitude) async {
   // if(latitude == null || longitude == null) return;
    ///22.58281300878745, 75.91504447344474
    Uri googleUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=22.58281300878745,75.91504447344474');
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    }
  }

  static Future<void> call(String? number) async {
    if(await canLaunchUrl(Uri(scheme: 'tel', path: number))){
      final Uri launchUri = Uri(scheme: 'tel', path: number,);
      await launchUrl(launchUri);
    }
  }
}