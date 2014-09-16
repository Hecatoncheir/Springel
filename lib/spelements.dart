library Spelements;
import 'dart:html';
part 'package:Spelements/realization.dart';

class SpringElements {
  ElementList List;
  Element Parent;
  int Limit;

  SpringElements({String elements, int limit}) {
    this.List = querySelectorAll('${elements}');
    this.Parent = querySelector('${List[0].tagName}').parent;

    if(limit != null){
      this.Limit = limit;
    }
    else {
      this.Limit =  List[0].marginEdge.width / 2;
    }

    _AddStyle(List, Parent);
    _positionForElement(list:List);
    _AddEvents(List, Limit);
  }
}