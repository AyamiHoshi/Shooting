//モブ敵設定

class Enemy{
  float xe;
  float ye;
  float speed = random(2)+0.5;
  float shotspeed = speed+random(2);
  int enemyhitpoint = 30;
  boolean enemyhit=false;
  Enemy(float xe,float ye){
    this.xe=xe;
    this.ye=ye;
    
  }
  void move(){//動き　上から下へ
    ye+=speed;
  }
  void enemyShot(){//モブ敵の銃撃
    Bullet bullet=new Bullet(xe,ye,shotspeed,90);
    if(score>=100){
      Bullet bullet1=new Bullet(xe,ye,shotspeed,70);
      Bullet bullet2=new Bullet(xe,ye,shotspeed,110);
      bulletList.add(bullet1);
      bulletList.add(bullet2);
    }
    bulletList.add(bullet);
  }
  void hit(){//Playerに当たったか
    enemyhit=true;
    if(enemyhit){
      audio1 = minim.loadFile("BGM2.mp3");
      audio1.play();
    }
  }
  boolean Remove(){//ヒットポイントがなくなるか、Playerに当たったら消滅
    if(enemyhitpoint<=0){
      score+=30;
      audio1 = minim.loadFile("BGM2.mp3");
      audio1.play();
    }
    return ye>height || enemyhit || enemyhitpoint<=0;
  }
  void draw(){//描画
    image(E,xe-size,ye-size,size*2,size*2);
    rect(xe-size,ye+size+2,size*2*enemyhitpoint/30,size/3);
    for(int j = mybulletList.size()-1;j>=0;j--){
      Bullet mybullet=mybulletList.get(j);
      if (sqrt(sq(xe-mybullet.xb)+sq(ye-mybullet.yb))<=size){
        mybullet.hit();
        
        enemyhitpoint-=10;
      }
    }
    if(frameCount%90 == 0){enemyShot();}
  }
}
