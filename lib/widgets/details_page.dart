import 'package:flutter/material.dart';
import 'package:rss/widgets/convertisseur_date.dart';
import 'package:rss/widgets/custom_text.dart';
import 'package:rss/widgets/open_feed.dart';
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
            padding(value: 25.0),
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
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: customText(item.description.toString(),maxLine: 500000,textAlign: TextAlign.center),
                ),
                Column(
                  children: [

                    FloatingActionButton(
                      splashColor: Colors.tealAccent,
                        onPressed:  ()=> openFeed(item.link.toString()),
                      elevation: 12.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                      ),
                      backgroundColor: Colors.teal,
                      child: const Icon(Icons.add,color: Colors.white,size: 40.0,),
                    ),
                    padding(bottom: 5.0,value: 5.0),
                    customText("Cliquez sur ce bouton pour lire pour lire l'article complet"
                    ,fontweight: FontWeight.normal,
                      fontSise: 16.8,
                      textAlign: TextAlign.center
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Padding padding({value=20.0,bottom=0.0}){
    return Padding(padding: EdgeInsets.only(top: value,bottom: bottom));
  }
}