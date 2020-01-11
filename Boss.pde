//ボス設定

class Boss{
  float xb;
  float yb;
  float theta;
  float shotspeed = 3;
  boolean bosshit=false;
  Boss(float xb,float yb){
   this.xb=xb;
   this.yb=yb;
  }
  void move(){//ボスの動き
    theta+=0.5;
    xb=width/2+100*cos(radians(theta));
    yb=height/3+100*sin(radians(theta));
  }
  void bossShot(){//ボスの銃撃
    Bullet bullet=new Bullet(xb,yb,shotspeed,90);
    Bullet bullet1=new Bullet(xb,yb,shotspeed,70);
    Bullet bullet2=new Bullet(xb,yb,shotspeed,110);
    bulletList.add(bullet1);
    bulletList.add(bullet2);
    bulletList.add(bullet);
  }
  boolean Remove(){//ヒットポイントが0になったらクリア
    if(bosshitpoint<=0){
      score+=1000;
      flagclear=0;
    }
    return bosshitpoint<=0;
  }
  void draw(){//描画
    textSize(80);
    text("BOSS",width/2,height/3);
    image(B,xb-size*2,yb-size*2,size*4,size*4);
    rect(xb-size*2,yb+size*2+2,size*bosshitpoint/25,size/3);
    for(int j = mybulletList.size()-1;j>=0;j--){//プレイヤーの銃弾が当たっているか調べる
      Bullet mybullet=mybulletList.get(j);
      if (sqrt(sq(xb-mybullet.xb)+sq(yb-mybullet.yb))<=size){//当たっていたら
        mybullet.hit();//プレイヤーの銃弾消して
        score+=10;//スコア入れて
        bosshitpoint-=10;//ボスのヒットポイントを削る
      }
    }      
    if(frameCount%90 == 0){bossShot();}//ボスの攻撃タイミング
  }
}
