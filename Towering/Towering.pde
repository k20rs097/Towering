
final int x = 9, y = 9;
// Blockクラスのオブジェクトをidで管理 0からスタートする
int id = 0;
// 変数gameModeの値：0 = タイトル 1 = ゲーム画面 
//                  2 = クリア画面 3 = ゲームオーバー
final int fieldWidth = (x-3)*50, fieldHeight = y * 50;
int gameMode = -1;
// Field型の変数fieldを宣言
// 変数fieldの値：0 = 何もない 1 = 壁 2 = ブロック
Field field = new Field(x, y);
// Game型の変数toweringを宣言
Game towering = new Game();
// Block型の変数blkを宣言
int blockAmount = field.toXIndex(9-2, 9-1);
Block[] blocks = new Block[blockAmount];
int countBlocks = 0;
// 最上段
int apex = 0;
int apexPrevious = apex;
int limit = 300;
//PImage block;
//PImage back;

void setup() {
  size(350, 460);
  background(255);
  //block = loadImage("box.png");
  //back = loadImage("back.png");
  init();
  towering.title();
}

void init() {
  // fieldの床部分を初期化
  for (int i = 0; i < x; i++) {
    field.setValue(i, y-1, 1);
  }
  // fieldの壁部分を初期化
  for (int j = 0; j < y; j++) {
    field.setValue(0, j, 1);
    field.setValue(8, j, 1);
  }
  // 各ブロックにidを追加
  for (int i = 0; i < blocks.length; i++) {
    blocks[i] = new Block(i);
  }
}

void keyPressed() {
  if (key == 's' && gameMode == -1) {
    gameMode = 0;
  }
}

void draw() {
  switch (gameMode) {
    case 0:
      towering.countDown();
      break;
    case 1:
      towering.game();
      break;
    case 2:
      towering.gameOver();
      break;
    case 3:
      towering.Clear();
      break;
  }
}
