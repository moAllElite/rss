import 'package:flutter/material.dart';
import 'package:rss/widgets/grid_view.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:rss/models/parser.dart';
import 'package:rss/widgets/liste.dart';
class HomePage extends StatefulWidget {
 const  HomePage({super.key,  required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
    variables
   */
  late  Orientation orientation;
  late RssFeed _feed;
  late String _title;
  String loadingFeedMsg="Loading";
  String feedLoadingErrorMsg="Error Loading Feed";
  String feedOpenErrorMsg="Error Opening Feed";
  var _refreshKey=GlobalKey<RefreshIndicatorState>() ;


  void updateTitle(title){
    setState(() {
      _title=title;
    });
  }

  void updateFeed(feed){
    setState(() {
      _feed=feed;
    });
  }
  Future load()async{
    updateTitle(loadingFeedMsg);
    Parser()
        .chargerRSS()
        .then(
            (result) {
              if(result.toString().isEmpty){
                updateTitle(feedLoadingErrorMsg);
                return;
              }else{
                updateFeed(result);
                updateTitle(_feed.title!.split(",").first);
              }
            }
    );
  }
  late bool _isLoading;
  @override
  void initState() {
    _isLoading=true;
     _refreshKey=GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
    Future.delayed(
        const Duration(seconds: 5),
        (){
          setState(() {
            _isLoading=false;
          });
        }
    );
    super.initState();
  }





    Widget body(){
      if (_isLoading == true) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.04),
                borderRadius: const BorderRadius.all(Radius.circular(16))
              ),
            ),
            const SizedBox(
              height: 32,
              child:  Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        );
      } else {
        return RefreshIndicator(
            key: _refreshKey,
            onRefresh: () => load(),
            child:
              (orientation == Orientation.portrait)?
                Liste(feed: _feed,) :  MyGridView(feed: _feed,)
     );
      }
   }

    Widget detailsPage(){
      return  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(

            )
          ],
      );
    }
  @override
  Widget build(BuildContext context) {
    orientation=MediaQuery.of(context).orientation;
    return   Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(_title),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 23.0,
            fontWeight: FontWeight.w400
          ),
        ),
        body:body(),
    );
  }
}
