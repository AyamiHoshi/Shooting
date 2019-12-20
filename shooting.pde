int click,exit,score;
int size=20;//player,enemy size
int hitpoint;
float flag;//fever
float x,y;//player posision
ArrayList<Bullet> bulletList;//enemy bullet
ArrayList<Bullet> mybulletList;//player bullet
ArrayList<Enemy> enemyList;//enemy
ArrayList<Item> itemList;
Player player;
Parents parents;//parents of enemy


void setup(){
   size(400,620);
   noStroke();
   click = 0;//number of push up
   exit = 0;
   score = 0;
   x = width/2;
   y = height-size;
   player = new Player();
   hitpoint = 100;
   parents = new Parents();
   bulletList = new ArrayList<Bullet>();
   enemyList = new ArrayList<Enemy>();
   mybulletList = new ArrayList<Bullet>();
   itemList = new ArrayList<Item>();
}

void draw(){
  background(0);
  frameRate(100);
  
  if(click==0){
    Start();
  }else if(player != null){
    Game();
  }else{
    gameoverwindow();
  }
}

void Start(){//make a start window
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("ShootingGame!",width/2,height/2);
  textSize(20);
  text("Push UP",width/2,height*2/3);
}


void Game(){
  fill(255);
  text("SCORE:",40,30);
  text(score,100,30);
    for(int k = mybulletList.size()-1;k>=0;k--){
      Bullet bullet=mybulletList.get(k);
      bullet.move();
      bullet.draw();
      if(bullet.Remove()){mybulletList.remove(k);}
    }
  fill(160,0,0);
  parents.draw();
    for(int j = enemyList.size()-1;j>=0;j--){
      Enemy enemy=enemyList.get(j);
      enemy.move();
      enemy.draw();
      if(enemy.Remove()){enemyList.remove(j);}
    }
    for(int i = bulletList.size()-1;i>=0;i--){
      Bullet bullet=bulletList.get(i);
      bullet.move();
      bullet.draw();
      if(bullet.Remove()){bulletList.remove(i);}
    }
    fill(255,255,0);
    for(int i = itemList.size()-1;i>=0;i--){
      Item item=itemList.get(i);
      item.move();
      item.draw();
      if(item.Remove()){itemList.remove(i);}
    }
    fill(255);
    player.move();
    player.draw();
 if(hitpoint<=0){player=null;}
}



void gameoverwindow(){
  background(0);
  fill(255);
  text("SCORE:",width/2-20,height/3);
  text(score,width/2+40,height/3);
  text("Push Enter",width/2,height/2);
  exit=1;
}  


void keyPressed(){//if press key
    if(keyCode==LEFT){
      
    }else if(keyCode==RIGHT){
      
    }else if(keyCode==UP){
      click++;      
    }else if(keyCode==DOWN){
      
    }else if(keyCode==ENTER){
      if(exit==1){
        exit();
      }
    }
}
