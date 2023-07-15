class ConvertisseurDate{

  String convertirDate(givenDate) {
    DateTime dateToUtc=givenDate.toUtc();
    const String il="Il y a";
     final today=DateTime.now();
    final time=today.difference(dateToUtc).inHours;
    final days=today.difference(dateToUtc).inDays;
    final minutes=today.difference(dateToUtc).inMinutes;
    if(days > 1){
      return "$il $days jours";
    }else if(days == 1){
      return "$il $days jour";

    }else if( time > 1) {
        return "$il $time heures";
    }else if (time == 1){
       return "$il $time heure";
    }else if (minutes > 1){
      return "$il $minutes minutes";
    }else if( minutes == 1){
      return "$il $minutes minute";
    }else{
      return "A l'instant";
    }

  }


}