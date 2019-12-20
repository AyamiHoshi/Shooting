class Item{
  float xi;
  float yi;
  float speed=random(1)+0.5;
  float theta=random(170)+5;
  boolean itemhit=false;
  Item(float xi,float yi){
    this.xi=xi;
    this.yi=yi;
  }
  void move(){
    xi+=cos(radians(theta))*speed;
    yi+=sin(radians(theta))*speed;
    if(xi>=400 || xi<=0){theta=180-theta;}
  }
  void hit(){
    itemhit=true;
  }
  boolean Remove(){
    return yi>height || itemhit;
  }
  void draw(){
    rect(xi-size/2,yi-size/2,size,size);
  }
}
