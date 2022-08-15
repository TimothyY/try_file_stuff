import 'package:html/parser.dart' show parse;
import 'dart:math' as math;

class QStringUtil{
  static  String verticalizeThisString(String inputString){
    String outputString="";
    for(int i=0; i<inputString.length; i++) {
      outputString = outputString+inputString[i]+"\n";
    }
    return outputString;
  }

  static void log(String scope, String content){
    printWrapped(scope+" -> "+content);
  }

  static capitalizeFirst(String input){
    if(input==null){return "";}else if(input.isEmpty){return "";}else{
      return '${input[0].toUpperCase()}${input.substring(1)}';
    }
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static String loremIpsum = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.";

  static String parseHtmlToPlainString(String htmlString) {

    var document = parse(htmlString);

    String parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  static String convertToMoneyFormat(double dAmount){
    QStringUtil.log("convertToMoneyFormat dAmount",dAmount.toString());
    int countComma = 0;
    double tempProcessedAmmount = dAmount;

    if(dAmount<0){tempProcessedAmmount=tempProcessedAmmount*-1;}

    while(tempProcessedAmmount>0){
      tempProcessedAmmount = (tempProcessedAmmount/1000).floorToDouble();
      countComma++;
    }

    int finalCountComma = countComma - 1;
    QStringUtil.log("convertToMoneyFormat finalCountComma",finalCountComma.toString());
    int milyar;
    int juta;
    int ribu;
    int satuan;
    int desimal;
    String output = "";
    if(finalCountComma==3){
      milyar = (dAmount/1000000000).floor();
      // juta = (dAmount/1000000).floor();
      juta = ((dAmount-(milyar*1000000000))/1000000).floor();
      ribu = ((dAmount-(milyar*1000000000)-(juta*1000000))/1000).floor();
      satuan = (dAmount-(milyar*1000000000)-(juta*1000000)-(ribu*1000)).floor();
      desimal = ((dAmount-(milyar*1000000000)-(juta*1000000)-(ribu*1000)-satuan)*100).floor();
      output = milyar.toString()+","+juta.toString().padLeft(3,'0')+","+ribu.toString().padLeft(3,'0')+","+satuan.toString().padLeft(3,'0')+"."+desimal.toString().padLeft(2,'0');
    } else if(finalCountComma==2){
      juta = (dAmount/1000000).floor();
      ribu = ((dAmount-(juta*1000000))/1000).floor();
      satuan = (dAmount-(juta*1000000)-(ribu*1000)).floor();
      desimal = ((dAmount-(juta*1000000)-(ribu*1000)-satuan)*100).floor();
      output = juta.toString()+","+ribu.toString().padLeft(3,'0')+","+satuan.toString().padLeft(3,'0')+"."+desimal.toString().padLeft(2,'0');
    }else if(finalCountComma==1){
      ribu = ((dAmount)/1000).floor();
      satuan = (dAmount-(ribu*1000)).floor();
      desimal = ((dAmount-(ribu*1000)-satuan)*100).floor();
      output = ribu.toString()+","+satuan.toString().padLeft(3,'0')+"."+desimal.toString().padLeft(2,'0');
    }else if(finalCountComma==0){
      satuan = dAmount.floor();
      desimal = ((dAmount-satuan)*100).floor();
      output = satuan.toString()+"."+desimal.toString().padLeft(2,'0');
    }
    return output;
  }

  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return ((bytes / math.pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  static String stringArrayToString(List<String> stringArray) {
    String combinedString = "";
    for(String s in stringArray){
      combinedString += s + ",";
    }
    if(combinedString != "") {
      return combinedString.substring(0, combinedString.length - 1);
    }
    return "";
  }

}