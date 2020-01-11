import ddf.minim.*;
Minim minim;
AudioPlayer audio,audio1,audio2,audio3,audio4;
PImage P,I,B,E;
int click=0,score;
int size=20;//プレイヤーと敵のサイズ
int hitpoint,bosshitpoint;//プレイヤーのヒットポイント
float flag;//プレイヤーの状態
float flagclear;//クリアしたか
float x,y;//プレイヤーの場所
ArrayList<Bullet> bulletList;//敵の弾
ArrayList<Bullet> mybulletList;//プレイヤーの弾
ArrayList<Enemy> enemyList;//敵
ArrayList<Boss> bossList;//ボス
ArrayList<Item> itemList;//アイテムリスト
ArrayList<Frame> frameList;
Player player;
Parents parents;//生みの親

void setup(){
   size(400,620);
   noStroke();
//値を初期化
   score = 0;
   click = 0;
   flag = 0;
   flagclear = 0;
   x = width/2;
   y = height-size;
   hitpoint = 100;
   bosshitpoint = 100;
   frameCount=0;
   
   
//新しいプレイヤー・親を作成
   P = loadImage("Player.PNG");
   I = loadImage("Item.PNG");
   B = loadImage("Boss.PNG");
   E = loadImage("Enemy.PNG");
   player = new Player();
   parents = new Parents();
   
//新しい敵銃弾・プレイヤー銃弾・アイテム・ボスリストを作成   
   bulletList = new ArrayList<Bullet>();
   enemyList = new ArrayList<Enemy>();
   mybulletList = new ArrayList<Bullet>();
   itemList = new ArrayList<Item>();
   bossList = new ArrayList<Boss>();
   frameList = new ArrayList<Frame>();
   for(int i=0;i<=100;i++){
    Frame frame=new Frame(random(width),random(height));
    frameList.add(frame);
   }

//フォントはこれ
   PFont font = createFont("MS Mincho",48);
   textFont(font);
//BGM
   minim = new Minim(this);
   audio = minim.loadFile("BGM1.mp3");
   audio3 = minim.loadFile("BGM4.mp3");
   audio.play();
   
}

void draw(){//画面遷移
  background(0);
  frameRate(100);
  
  if(click==0){//最初はスタート画面
    Start();
  }else if(player != null && bosshitpoint>0){//基本はゲーム画面
    Game();
  }else if(player != null && flagclear==0){//ボス倒したらクリア画面
    gameclearwindow();
  }else{//自分が死んだり、クリア画面後はゲームオーバー画面
    gameoverwindow();
  }
}
