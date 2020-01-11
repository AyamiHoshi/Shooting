//アイテム、敵、ボス各リストへの追加

class Parents{
  float xe;
  float ye = -size;
  float xi;
  float yi = -size;
  float xb = width/2;
  float yb = height/3;
  int flag = 0;
  void childenemy(){//モブ敵を生む
    Enemy enemy=new Enemy(xe,ye);
    enemyList.add(enemy);
  }
  void childitem(){//アイテムを生む
    Item item=new Item(xi,yi);
    itemList.add(item);
  }
  void boss(){//ボスを生む
    Boss boss=new Boss(xb,yb);
    bossList.add(boss);
  }
    
  void draw(){//それぞれ呼び出し
    if(frameCount%250==0 && frameCount<3000){
      xe = random(width-size)+size/2;
      childenemy();
    }
    if(frameCount%20>=0 && frameCount%20<=10 && frameCount>=2800 && flagclear==0){

      audio3.play();
      fill(255,255,200);
      textSize(80);
      text("BOSS",width/2,height/3);
    }
    if(frameCount==3000){
      boss();
      flagclear=1;
    }
    if(frameCount%1000==0 && frameCount!=0){
      xi = random(width-size)+size/2;
      childitem();
    }
  }
}
