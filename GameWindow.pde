//各リスト呼び出し、描画

void Game(){
  fill(255);
  textSize(20);
  text("SCORE:",40,30);
  text(score,100,30);
    for(int k = mybulletList.size()-1;k>=0;k--){//Playerの銃弾
      Bullet bullet=mybulletList.get(k);
      bullet.move();
      bullet.draw();
      if(bullet.Remove()){mybulletList.remove(k);}
    }
  fill(255);
    for(int i = frameList.size()-1;i>=0;i--){//背景
      Frame frame=frameList.get(i);
      frame.move();
      frame.draw();
    }
  fill(160,0,0);
  parents.draw();
    for(int j = enemyList.size()-1;j>=0;j--){//モブ敵
      Enemy enemy=enemyList.get(j);
      enemy.move();
      enemy.draw();
      if(enemy.Remove()){
        enemyList.remove(j);
      }
    }
    for(int i = bulletList.size()-1;i>=0;i--){//敵の銃弾
      Bullet bullet=bulletList.get(i);
      bullet.move();
      bullet.draw();
      if(bullet.Remove()){bulletList.remove(i);}
    }
    fill(255,255,0);
    for(int i = itemList.size()-1;i>=0;i--){//アイテム
      Item item=itemList.get(i);
      item.move();
      item.draw();
      if(item.Remove()){itemList.remove(i);}
    }
    fill(255,255,200);
    for(int i = bossList.size()-1;i>=0;i--){//ボス
      Boss boss=bossList.get(i);
      boss.move();
      boss.draw();
      if(boss.Remove()){
        bossList.remove(i);
        audio1 = minim.loadFile("BGM2.mp3");
        audio1.play();
      }
    }
    fill(255);//以下Playerについて
    player.move();
    player.draw();
 if(hitpoint<=0){
   player=null;
   audio1 = minim.loadFile("BGM2.mp3");
   audio1.play();
 }
}
