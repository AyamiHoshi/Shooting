//アイテム設定

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
  void move(){//アイテムの動き、基本上から下、壁に当たったら跳ね返る
    xi+=cos(radians(theta))*speed;
    yi+=sin(radians(theta))*speed;
    if(xi>=400 || xi<=0){theta=180-theta;}
  }
  void hit(){//Playerに当たったか
    itemhit=true;
    if(itemhit){
      audio4 = minim.loadFile("BGM5.mp3");
      audio4.play();
    }
  }
  boolean Remove(){//Playerに当たるか、画面外に飛び出したら消滅
    return yi>height || itemhit;
  }
  void draw(){//描画
    image(I,xi-size/2,yi-size/2,size,size);
  }
}
