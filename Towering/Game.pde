class Game {
  void title() {
    background(255);
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("Press 's' Key To Start", width/2, height/2);
  }
  
  void countDown()  {
    int limit = 3;
    int count;
    int millis = millis()/1000;
    fill(#ffffff);
    size(350, 460);
    rect(0, 0, 350, 500);
    fill(#000000);
    text("Ready...", width/2, height/2);
    count = limit - millis;
    if (count == 0) {
      size(350, 460);
      rect(0, 0, 350, 500);
      text("Start!", width/2, height/2);
    } else if (count <= -1) {
      gameMode = 1;
      return;
    }
  }
  
  void game() {
    size(350, 460);
    rect(0, 0, 350, 500);
    strokeWeight(0);
    fill(#FFFF9F);
    rect(0, 50, 350, 5);
    rect(0, 460, 350, 5);
    //field.printField();
    if (countBlocks >= blockAmount-2 || field.isHorizontal()) {
      gameMode = 2;
      return;
    } else if (field.isVertical()){ 
      gameMode = 3;
    }
    
    if (!blocks[countBlocks].isGround) {
      blocks[countBlocks].draw();
      blocks[countBlocks].keyPressed();
    }
    else if (blocks[countBlocks].isGround) {
      countBlocks += 1;
      blocks[countBlocks].setup();
      apexPrevious = apex;
      apex = field.getApex();
      if (apexPrevious != apex) {
        limit -= 40;
      }
      keyCode = 0;
    }
    
    for (int i = 0; i < countBlocks; i += 1) {
      if (blocks[i].id != countBlocks) {
        blocks[i].draw();
      }
    }
  }
  
  void Clear() {
    text("Clear!!", width/2, height/2);
  }
  
  void gameOver() {
    fill(255, 0, 0);
    text("Game Over...", width/2, height/2);
  }
  
}
