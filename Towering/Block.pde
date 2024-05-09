class Block {
  private final int BLOCK_WIDTH = 50, BLOCK_HEIGHT = 50;
  private int vy = 10;
  private int x = 0, y = 50;
  private int id;
  private boolean isGround = false;
  private boolean isDrop = false;
  private boolean isTurn = false;
  // x座標とy座標を配列の添字に変換
  private int xIndex = x/50+1, yIndex = y/50-1;
  // 時間を扱う関数
  int time0 = 0;// 基準時間
  int time = millis()-time0;
  

  Block (int id) {
    this.id = id;
  }

  void setup() {
    init();
  }
  
  void init() {
    x = getRondomX();
    y = 50;
    xIndex = x/50+1;
    yIndex = y/50-1;
    isGround = false;
  }

  void move() {
    if(!isDrop) {
      if(!isTurn) {
        right();
      }
      else if (isTurn) {
        left();
      }
    }
  }
  
  void right() {
    if(x < fieldWidth) {
      x += 50;
    } else {
      isTurn = true;
      left();
    }
  }
  
  void left() {
    if(x > 0) {
      x -= 50;
    } else {
      isTurn = false;
      right();
    }
  }
  
  void fall() {
    if (y < fieldHeight) {
      isDrop = true;
      xIndex = x / 50+1;
      yIndex = y / 50-1;
      y += vy;
    }
    if (field.getIndexValue(xIndex, yIndex+1) == 1 || field.getIndexValue(xIndex, yIndex+1) == 2) {
      field.setValue(xIndex, yIndex, 2);
      isGround = true;
      isDrop = false;
      return;
    }
  }
  
  int getRondomX() {
    int X = (int)random(0, fieldWidth - 50);
    if (X % 50 != 0) {
      X -= (X % 50);
    }
    return X;
  }
  
  boolean IsControllable(int countBlocks) {
    if (countBlocks == id) {
      return true;
    } else {
      return false;
    }
  }
  
  void keyPressed() {
    if (keyCode == ' ') { fall(); }
  }

  // コンソールに各ステータスを表示
  void printStatus() {
    println("Status ID: [" + id + "]");
    println("x: " + x +"  y: " + y);
    println("drop: " + isDrop + "  ground: " + isGround);
    println("idX: " + xIndex + "  idY: " + yIndex);
    println("One Step Below: " + field.getIndexValue(xIndex, yIndex+1));
  }
  
  void draw() {
    time = millis()-time0;
    if (countBlocks == id && time >= limit) {
      move();
      time0 = millis();
    }
    fill(#FFFFFF);
    size(350, 460);
    rect(x, y, BLOCK_WIDTH, BLOCK_HEIGHT);
  }
}
