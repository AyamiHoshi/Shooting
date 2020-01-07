  void childenemy(){
    Enemy enemy=new Enemy(xe,ye);
    enemyList.add(enemy);
  }
  void childitem(){
    Item item=new Item(xi,yi);
    itemList.add(item);
  }
  void boss(){
    Boss boss=new Boss(xb,yb);
    bossList.add(boss);
  }
    
  void draw(){
    if(frameCount%250==0 && frameCount<3000){
      xe = random(width-size)+size/2;
      childenemy();
    }
    if(frameCount%20>=0 && frameCount%20<=10 && frameCount>=2800 && flag == 0){
      fill(255,255,200);
      textSize(80);
      text("BOSS",width/2,height/3);
    }
    if(frameCount==3000 && flag == 0){
      boss();
      flag = 1;
    }
    if(frameCount%1000==0 && frameCount!=0){
      xi = random(width-size)+size/2;
      childitem();
    }
  }
}
