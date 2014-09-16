import 'package:SpElements/spelements.dart';

main(){
  new SpringElements(
      elements: '.n1 a'
  );

  new SpringElements(
      elements: '.mainLinks a',
      limit: 130
  );

}