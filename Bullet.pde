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
  void move(){
    xb+=cos(radians(theta))*speed;
    yb+=sin(radians(theta))*speed;
  }
  void hit(){
    bullethit=true;
  }
  boolean Remove(){
    return yb<0 || yb>height || bullethit;
  }
  void draw(){
    ellipse(xb,yb,size/2,size/2);
  }
}