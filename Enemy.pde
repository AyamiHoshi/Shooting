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
  void move(){
    ye+=speed;
  }
  void enemyShot(){
    Bullet bullet=new Bullet(xe,ye,shotspeed,90);
    if(score>=100){
      Bullet bullet1=new Bullet(xe,ye,shotspeed,70);
      Bullet bullet2=new Bullet(xe,ye,shotspeed,110);
//    Bullet bullet3=new Bullet(xe,ye,shotspeed,0);
      bulletList.add(bullet1);
      bulletList.add(bullet2);
    }
    bulletList.add(bullet);
  }
  void hit(){
    enemyhit=true;
  }
  boolean Remove(){
    if(enemyhitpoint<=0){score+=30;}
    return ye>height || enemyhit || enemyhitpoint<=0;
  }
  void draw(){
    rect(xe-size,ye-size,size*2,size*2);
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
