import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Icon rightIcon(){
  return const Icon(
    Icons.keyboard_arrow_right,
    color: Colors.grey,
    size: 30.0,
  );
}

/*
 * thumbnail image
 */
String placeholderImg="images/no_image.png";
@override
Widget thumbnail(imageUrl){
  return SizedBox(
    //padding:const EdgeInsets.only(left: 0.0),
    child: CachedNetworkImage(
        placeholder: (context,url)=> Image.asset(placeholderImg),
        imageUrl: imageUrl,
        alignment: Alignment.center,
        fit: BoxFit.fill,
    ),
  );
}
Widget thumbGrid(imageUrl){
  return Padding(
    padding:const EdgeInsets.only(left: 15.0),
    child: CachedNetworkImage(
        placeholder: (context,url)=> Image.asset(placeholderImg),
        imageUrl: imageUrl,
        height: 70,
        width: 100,
        alignment: Alignment.center,
        fit: BoxFit.fill
    ),
  );
}
