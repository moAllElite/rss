import 'package:flutter/material.dart';
import 'package:rss/widgets/details_page.dart';
import 'package:rss/widgets/style.dart';
import 'package:webfeed/domain/rss_feed.dart';

import 'package:webfeed/domain/rss_item.dart';
import 'custom_text.dart';
import 'convertisseur_date.dart';
class Liste extends StatelessWidget{
  final  RssFeed feed;
  const  Liste({super.key,required this.feed});



  @override
  Widget build(BuildContext context) {
    final taille = MediaQuery.of(context).size.width / 2.5;

    return ListView.builder(
      //separatorBuilder: (BuildContext context, int index) => const Card(),
        itemCount:feed.items!.length,
        itemBuilder: (BuildContext context ,int index){
          RssItem item=feed.items![index];
        //  RssItem item = widget.feed.items[i];
          return InkWell(
            //onTap: () => openFeed(item.link.toString())
            onTap: ()=>Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return  DetailsPage(item: item);
              })
            )
            ,
            child: Card(
              shape:const  RoundedRectangleBorder(
                borderRadius: BorderRadius.zero
              ),
              elevation: 10.0,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          child: customText(item.categories!.single.value)
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        child: customText(
                            ConvertisseurDate().convertirDate(item.pubDate),
                          fontSise: 14.2,
                          fontweight: FontWeight.normal
                        ),
                      )
                    ],
                  ),
               Row(
                 children: [
                   Card(
                     shape:const  RoundedRectangleBorder(
                         borderRadius: BorderRadius.zero
                     ),
                     elevation: 7.5,
                     child: SizedBox(
                       width: taille,
                       child:  thumbnail(item.enclosure?.url),
                     ),
                   ),
                   Container(
                     margin: const EdgeInsets.only(left: 10.0),
                     width: taille,
                     child: customText(item.title.toString(),fontSise: 16.0),
                   )
                 ],
               )
                ],
              ),
            ),
          );
        }
    );
  }

}


