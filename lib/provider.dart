import 'model.dart';
import 'bloc.dart';

import 'package:flutter/widgets.dart';

class TextProvider extends InheritedWidget { //Provider used in presenting data retrieved from BLoC
  final MyTextBloc myTextBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true; 

  static MyTextBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(TextProvider) as TextProvider)
          .myTextBloc;

  TextProvider({Key key, MyTextBloc myTextBloc, Widget child})
  : this.myTextBloc = myTextBloc ?? MyTextBloc(Utils()),
  super(child: child, key: key); 
}
