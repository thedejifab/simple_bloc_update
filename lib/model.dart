

class MyText{
  final String text;

  MyText(this.text);

}

class Utils{
  Future<MyText> get(String text) async{
    return MyText("This is what I wanna return");
  } //function returning reversed value of the initialText
}