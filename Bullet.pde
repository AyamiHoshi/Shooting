//銃弾設定

class Bullet{
  float xb;
  float yb;
  float speed;
  float theta;
  boolean bullethit=false;
  Bullet(float xb,float yb,float speed,float theta){
    this.xb=xb;
    this.yb=yb;
    this.speed=speed;
    this.theta=theta;
  }
  void move(){//銃弾の動き　Θの向きに発射するよ
    xb+=cos(radians(theta))*speed;
    yb+=sin(radians(theta))*speed;
  }
  void hit(){//銃弾が当たったか
    bullethit=true;
    if(bullethit){
      audio2 = minim.loadFile("BGM3.mp3");
      audio2.play();
    }
  }
  boolean Remove(){//画面から出たり、ヒットしたら消す
    return xb<0 || xb>width || yb<0 || yb>height || bullethit;
  }
  void draw(){//銃弾描画
    ellipse(xb,yb,size/2,size/2);
  }
}
