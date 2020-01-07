void gameclearwindow(){
  background(0);
  fill(255);
  textSize(80);
  text("CLEAR",width/2,height/3);
  textSize(20);
  text("Enter",width/2,height/2);
  
  if(keyPressed==true && key==ENTER){
    flagclear=1;
    gameoverwindow();
  }
  
}  
