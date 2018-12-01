

class MyText{
  final String text;
  String me;

  MyText(this.text);    

}

class Utils{
  Future<MyText> get(String text) async{
    return MyText(reverse(text));
  } //function returning reversed value of the initialText

  String reverse(String text){
    String result = text.split('').reversed.join();
    return result;
  }//simple function to reverse the input text
}