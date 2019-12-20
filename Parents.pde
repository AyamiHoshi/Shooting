class Parents{
  float xe;
  float ye = -size;
  float xi;
  float yi = -size;
  void childenemy(){
    Enemy enemy=new Enemy(xe,ye);
    enemyList.add(enemy);
  }
  void childitem(){
    Item item=new Item(xi,yi);
    itemList.add(item);
  }
  void draw(){
    if(frameCount%250==0){
      xe = random(width-size)+size/2;
      childenemy();
    }
    if(frameCount%1000==0 && frameCount!=0){
      xi = random(width-size)+size/2;
      childitem();
    }
  }
}
