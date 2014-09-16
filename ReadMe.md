#Dart библиотека Springel

[Springel Library site](http://rasarts.github.io/SpElements/)

Создает элементы которые при наведении цепляясь к курсору, следуют за ним на определенное расстояние.

Подключение библиотеки:

```
import 'package:SpElements/spelements.dart';
```
Подключать библиотеку *dart:html* не обязательно.


Создание объекта:

```
main(){
  new SpringElements(
      elements: '.n1 a',
      limit: 30
  );
}
```

Конструктор класса выглядит следующем образом:

```
SpringElements({String elements, int limit}){
    *realization*
}
```

Элементы определяются передачей *строки* тегов, классов и т.д... в качестве аргумента *elements*:

```
new SpringElements(
  elements: '.nav a'
);
```

Параметр *limit* принимает в качестве аргумента *число* - обозначающее предел до которого элемент будет следовать за курсором, а затем отскочит обратно на своё место.

```
  new SpringElements(
      elements: 'div',
      limit: 30
  );
```

Если limit не указан, элемент будет отдаляться за курсором на полную свою ширину + отступы.


---

#Dart Springel Library

Creates elements that clinging to the cursor, follow him at a certain distance.

Import library:

```
import 'package:springel/springel.dart';
```

*dart:html* not necessarily connected.


Create object:

```
main(){
  new SpringElements(
      elements: '.n1 a',
      limit: 30
  );
}
```

Constructor:

```
SpringElements({String elements, int limit}){
    *realization*
}
```

Elements are determined by the *string* of tags, classes, etc ... as an argument *elements*:

```
new SpringElements(
  elements: '.nav a'
);
```

*limit* is a number - designating a limit to which the element will follow cursor.

```
  new SpringElements(
      elements: 'div',
      limit: 30
  );
```

If limit is not specified, the item will move away on its full width + margin.