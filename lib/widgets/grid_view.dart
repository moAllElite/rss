import 'package:flutter/material.dart';
import 'package:rss/widgets/details_page.dart';
import 'package:webfeed/domain/rss_feed.dart';

import 'custom_text.dart';
import 'convertisseur_date.dart';
import 'open_feed.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key,required this.feed});
  final RssFeed feed;

  @override
  Widget build(BuildContext context) {

    return   GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: feed.items!.length,
      itemBuilder: (BuildContext context , int index){
        final item=feed.items![index];
        return    InkWell(
          onTap:()=>Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context){
              return  DetailsPage(item: item);
            })
        ),
          child: Card(
            shape:const  RoundedRectangleBorder(
                borderRadius: BorderRadius.zero
            ),
            elevation: 10.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      item.categories!.single.value,
                    ),
                    customText(
                        ConvertisseurDate().convertirDate(item.pubDate),
                        fontSise: 14.2,
                        maxLine: 1,
                        fontweight: FontWeight.normal
                    ),
                  ],
                ),
                customText(item.title.toString() ,fontSise: 15.0),
                Card(
                    shape:const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                    ),
                    elevation: 0.5,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3.5,
                        child: Image.network(
                          item.enclosure!.url.toString(),
                          fit: BoxFit.fill,
                        )
                    )
                ),

              ],
            ),
          ),
        );
      },

    );
  }
}
/*  child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    child: thumbGrid(item.enclosure!.url)
                ),
                customText(item.title.toString() ,fontSise: 15.0),
                customText(Metier().since(item.pubDate),fontSise: 14.2,fontweight: FontWeight.w300),
              ],
            ),*/