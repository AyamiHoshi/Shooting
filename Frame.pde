//背景の星

class Frame{
  float xf=random(width);
  float yf=random(height)-height;
    Frame(float xf,float yf){
      this.xf=xf;
      this.yf=yf;
    }
    void move(){//上から下に、下に行ったらまた上に戻ってくる
      yf+=0.5;
      yf=yf%height;
    }
    void draw(){//描画
      ellipse(xf,yf,3,3);
    }
}
