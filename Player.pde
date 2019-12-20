class Player{
  void move(){
    if(keyPressed){
      switch(keyCode){
        case UP: y-=2;break;
        case DOWN: y+=2;break;
        case LEFT: x-=2;break;
        case RIGHT: x+=2;break;
      }
    }
    if(x-size<0){x=size;}
    if(x+size>width){x=width-size;}
    if(y-size<0){y=size;}
    if(y>height-20-size){y=height-20-size;}
  }
  
  void playerShot1(){
    Bullet bullet=new Bullet(x,y,2,270);
    mybulletList.add(bullet);
  }
  void playerShot2(){
    Bullet bullet=new Bullet(x,y,2,270);
    Bullet bullet1=new Bullet(x,y,2,250);
    Bullet bullet2=new Bullet(x,y,2,290);
    mybulletList.add(bullet2);
    mybulletList.add(bullet1);
    mybulletList.add(bullet);
  }
  void draw(){
    if(hitpoint<=30){
      if(frameCount%3==0){fill(255,0,0);triangle(x,y-size,x-size,y+size,x+size,y+size);}
    }else{
      if(hitpoint<=50){fill(0,0,255);}
      triangle(x,y-size,x-size,y+size,x+size,y+size);
    }
    rect(0,600,4*hitpoint,20);
    fill(255);
    for(int j = enemyList.size()-1;j>=0;j--){
      Enemy enemy=enemyList.get(j);
      if (sqrt(sq(x-enemy.xe)+sq(y-enemy.ye))<=size*2){
        enemy.hit();
        hitpoint-=20;
        flag=0;
      }
    }
    for(int j = bulletList.size()-1;j>=0;j--){
      Bullet bullet=bulletList.get(j);
      if (sqrt(sq(x-bullet.xb)+sq(y-bullet.yb))<=size){
        bullet.hit();
        hitpoint-=10;
        flag=0;
      }
    }
    for(int j = itemList.size()-1;j>=0;j--){
      Item item=itemList.get(j);
      if (sqrt(sq(x-item.xi)+sq(y-item.yi))<=size){
        item.hit();
        flag=int(random(2))+1;
       
      }
    }
    if (frameCount%30 == 0){
      if(flag == 1){playerShot2();}
      else{playerShot1();}
      if(flag == 2){
        if(hitpoint>=70){hitpoint=100;}
        else{hitpoint+=30;}
        flag=0;
      }
      
    }
  }
}
