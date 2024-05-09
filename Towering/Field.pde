// 2次元配列を扱うクラス、データの持ち方は1次元
class Field {
  int w;// 幅
  int h;// 高さ
  final int outOfRange = -1;// 範囲外を指定したときの値
  // fieldを一次元配列化する
  int[] values = {};

  Field(int w, int h) {
    this.w = w;
    this.h = h;
    values = new int[w * h];
  }
 
  // 座標を1次元配列化する
  int toXIndex(int x, int y) {
    if ( isOutOfRange(x, y) ) { return outOfRange; }
    return x + (y * w);
  }
  
  // 領域外かチェックする
  boolean isOutOfRange(int x, int y) {
    if (x < 0 || x >= w) { 
      return true; 
    }
    if (y < 0 || y >= h) {
      return true;
    }
    return false;
  }

  int getIndexValue(int x, int y) {
    if ( isOutOfRange(x, y) ) {
      return outOfRange;
    } else {
      return values[y * w + x] ;
    }
  }
  
  void setValue(int x, int y, int v) {
    if ( isOutOfRange(x, y) ) {
      return;
    } else {
      values[y * w + x] = v;
    }
  }

  // 縦一列が埋まっているか確認
  boolean isVertical() {
    for (int i = 0; i < h; i += 1) {
      if(getIndexValue(i, 0) == 2){ return true; }
    }
    return false;
  }
  
  // 横一列が埋まっているか確認
  boolean isHorizontal() {
    for (int i = 0; i < h; i += 1) {
      if (getIndexValue(i, 7) == 0){
        return false;
      }
    }
    return true;
  }
  
  // ゲーム画面にフィールドのマス目を表示
  void printField() {
    for (int i = 0; i < h-1; i += 1) {
      for (int j = 0; j < w-2; j += 1) {
        fill(0, 150, 0, 128);
        rect(j * 50, i * 50 + 60, 50, 50);
      }
    }
  }
  
  int getApex() {
    for (int i = 1; i < h-1; i += 1) {
      for (int j = 0; j < w-2; j += 1) {
        if(getIndexValue(j, i) == 2) {
          return (h-1)-i;
        }
      }
    }
    return 1;
  }
  
  // コンソールに配列の状態を表示
  void debug() {
    println("[Field] (w, h) = (" +w+","+h+")");
    for (int y = 0; y < h; y += 1) {
      for (int x = 0; x < w; x += 1) {
        print(getIndexValue(x, y) + ",");
      }
      println();
    }
  }
  
}
