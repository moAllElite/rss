import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';
class Parser {
  String feedURL="https://www.france24.com/fr/afrique/rss";
  //"https://www.footmercato.net/flux-rss";
  // "http://www.topmercato.com/rss.php";
  Future<RssFeed> chargerRSS() async {
      final client=http.Client();
      final response=await client.get(Uri.parse(feedURL));
      return RssFeed.parse(response.body);
  }

}