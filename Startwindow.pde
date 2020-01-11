//スタート画面作成

void Start(){
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("ShootingGame!",width/2,height/2);
  textSize(20);
  text("Enterを押してスタート",width/2,height*2/3);
  
  if(keyPressed==true && key==ENTER){
    frameCount=0;
    click=1;
  }
}
