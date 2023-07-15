import 'package:url_launcher/url_launcher_string.dart';

Future<void> openFeed(String url) async{
  if(!await launchUrlString(
    url,
    mode:LaunchMode.externalApplication,
  )
  ){
    throw "Can not launch url";
  }
}