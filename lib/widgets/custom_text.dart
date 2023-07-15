import 'package:flutter/cupertino.dart';

Text customText(
    String title,
    {fontSise=18.1,
      FontWeight fontweight=FontWeight.w600,
      int maxLine=3,
      TextOverflow overflow=TextOverflow.ellipsis,
      FontStyle fontStyle=FontStyle.normal,
     TextAlign textAlign=TextAlign.left
    }
    ){
  return  Text(
    title,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSise,
      fontStyle: fontStyle,
      fontWeight: fontweight,
    ),
    maxLines: maxLine,
    overflow: overflow,
  );
}