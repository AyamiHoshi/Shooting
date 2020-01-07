
void gameoverwindow(){
  background(0);
  fill(255);
  textSize(50);
  text("SCORE:",width/2-40,height/3);
  text(score,width/2+80,height/3);
  textSize(20);
  text("Rを押してリスタート",width/2,height/2);
  text("Backspaceを押して終了",width/2,height/2+30);
  
  
  if(keyPressed==true && key==BACKSPACE){
    exit();
  }else if(key=='R' || key=='r'){
    setup();
  }
  
}  
