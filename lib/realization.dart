part of springel;

void _AddStyle(ElementList list, Element parent){
  var parentHeight = parent.contentEdge.height;
  var listElementHeight = list[0].getComputedStyle().marginBottom.replaceAll('px','');

  var FullParentHeight = parentHeight + int.parse(listElementHeight);

  parent.style
    ..position = 'relative'
    ..display = 'block'
    ..height = '${FullParentHeight}px';
}

void _AddEvents(ElementList list, int limit){

  list.onMouseMove.listen((event){
    list.forEach((el){
      el.style
        ..opacity = '0.5'
        ..zIndex = '2'
        ..transitionDelay = "21s"
        ..transform = 'scale(0.8)'
        ..transition = 'all 30ms cubic-bezier(0.455, 0.03, 0.515, 0.955)';
    });

    _pursuitAndStop(event, limit);
  });


  list.onMouseLeave.listen((event){
    list.forEach((el){
      el.style
        ..opacity = '1'
        ..transition = 'all 330ms'
        ..transform = 'scale(1)';
    });
    _positionForElement(element:event.target);
  });

}


void _positionForElement({list, element}){
  if(list != null){

    var ParentPadding = int.parse(list[0].parent.getComputedStyle().paddingLeft.replaceAll('px',''));

    int iterator = 0;
    list.forEach((el){
      var leftPosition = ParentPadding + el.marginEdge.width * iterator++;
      var topPosition = el.offsetTop;

      el.attributes['left'] = '$leftPosition';
      el.attributes['top'] = '$topPosition';

      el.style
        ..position = 'absolute'
        ..top = '${topPosition}px'
        ..left = '${leftPosition}px';
    });
  }

  if(element != null){
    var leftPosition = element.attributes['left'];
    var topPosition = element.attributes['top'];
    element.style
      ..position = 'absolute'
      ..top = '${topPosition}px'
      ..left = '${leftPosition}px'
      ..transition = 'all 80ms cubic-bezier(0.15, -0.15, 0.15, 1.8)';
  }

}


void _pursuitAndStop(Event event, int limit){
  var etarget = event.target;

  var positionX = event.page.x;
  var positionY = event.page.y;

  var contentWidth = etarget.marginEdge.width;
  var contentHeight = etarget.marginEdge.height;

  var offSetLeft = etarget.offsetLeft;
  var offSetTop = etarget.offsetTop;

  var parentOffSetTop = etarget.parent.offsetTop;
  var parentOffSetLeft = etarget.parent.offsetLeft;

  var X = positionX - contentWidth / 2 - parentOffSetLeft;
  var Y = positionY - contentHeight / 2 - parentOffSetTop;

  var leftPosition = int.parse(etarget.attributes['left']);
  var topPosition = int.parse(etarget.attributes['top']);

  etarget.style
    ..opacity = '1'
    ..transform = 'scale(1)'
    ..zIndex = '1'
    ..left = '${X}px'
    ..top = '${Y}px';

  if(positionX > parentOffSetLeft + leftPosition + contentWidth + limit){
    _positionForElement(element:etarget);
  }

  if(positionX < parentOffSetLeft + leftPosition - limit){
    _positionForElement(element:etarget);
  }

  if(positionY > parentOffSetTop + topPosition + contentHeight + limit){
    _positionForElement(element:etarget);
  }

  if(positionY < parentOffSetTop + topPosition - limit){
    _positionForElement(element:etarget);
  }

}