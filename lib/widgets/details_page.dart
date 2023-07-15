import 'package:flutter/material.dart';
import 'package:rss/widgets/convertisseur_date.dart';
import 'package:rss/widgets/custom_text.dart';
import 'package:webfeed/webfeed.dart';

class DetailsPage extends StatelessWidget{
  final RssItem item ;
  const DetailsPage({super.key,required this.item});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: customText("Details page",fontSise: 25.0,fontweight: FontWeight.normal),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            padding(value: 50.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                    child: customText(
                        item.title.toString(),
                      textAlign: TextAlign.center
                    )
                ),
                padding(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:EdgeInsets.only(left: MediaQuery.of(context).size.width / 17),
                      child: customText(
                        item.categories!.single.value.toString(),
                        fontSise: 17.0,
                        fontweight: FontWeight.normal,
                      ),
                    ),
                    Container(
                     margin:EdgeInsets.only(right: MediaQuery.of(context).size.width / 15),
                      child: customText(
                          ConvertisseurDate().convertirDate(item.pubDate),
                          fontSise: 17.0,
                        fontweight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                padding(),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width  / 0.5,
                    child: Card(
                      elevation: 7.5,
                      child: Image(
                          image: NetworkImage(item.enclosure!.url.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                ),
                padding(value: 50.0),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: customText(item.description.toString(),maxLine: 500000,textAlign: TextAlign.center),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  Padding padding({value=20.0}){
    return Padding(padding: EdgeInsets.only(top: value));
  }
}