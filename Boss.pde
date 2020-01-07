int click,exit,score;
int size=20;//プレイヤーと敵のサイズ
int hitpoint,bosshitpoint;//プレイヤーのヒットポイント
float flag;//プレイヤーの状態
float flagclear;
float x,y;//プレイヤーの場所
ArrayList<Bullet> bulletList;//敵の弾
ArrayList<Bullet> mybulletList;//プレイヤーの弾
ArrayList<Enemy> enemyList;//敵
ArrayList<Boss> bossList;
ArrayList<Item> itemList;//アイテムリスト
Player player;
Parents parents;//敵の親玉
PFont font;//フォント決定


void setup(){
   size(400,620);
   noStroke();
   click = 0;//number of push up
   exit = 0;
   score = 0;
   flag = 0;
   flagclear = 0;
   x = width/2;
   y = height-size;
   player = new Player();
   hitpoint = 100;
   bosshitpoint = 100;
   parents = new Parents();
   bulletList = new ArrayList<Bullet>();
   enemyList = new ArrayList<Enemy>();
   mybulletList = new ArrayList<Bullet>();
   itemList = new ArrayList<Item>();
   bossList = new ArrayList<Boss>();
   font = createFont("MS Mincho",48);
   textFont(font);
   frameCount=0;
}

void draw(){
  background(0);
  frameRate(100);
  
  if(click==0){
    Start();
  }else if(player != null && bosshitpoint>0){
    Game();
  }else if(flagclear==0){
    gameclearwindow();
  }else{
    gameoverwindow();
  }
}



void keyPressed(){//キーボードを押したら
  if(keyCode==ENTER){
      click++;      
  }
}
