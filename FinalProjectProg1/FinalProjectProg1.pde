Ball ball;

Block topBlock;
Block bottomBlock;

float groundY = 360;

boolean gameStarted = false;
boolean gameOver = false;

void setup(){
size(400, 400);  

ball = new Ball(60, groundY - 20);

topBlock = new Block(400, true);
bottomBlock = new Block(600, false);
}

void draw(){
  background(#B7A6B6);
  
  //Ground
  noStroke();
  fill(#204988); //colour for Ground
  rect(0, 360, 400, 40);
  
  //before first space pressed the blocks stay still
    //if(gameStarted){
    //  topBlock.update();
    //  bottomBlock.update();
    //}
    
    //update objects only when the game s running
    if(gameStarted && !gameOver){
      ball.update();
      topBlock.update();
      bottomBlock.update();
      
      //if the ball touch the blocks = you lose
      if(hitBlock(ball, topBlock) || hitBlock(ball, bottomBlock)){
        gameOver = true;
      }
    }
  
  ball.display();
  topBlock.display();
  bottomBlock.display();
  
}

void keyPressed(){
  if(key == ' '){
    if(!gameStarted){
      gameStarted = true; //the blocks will start moving once you preesed the space key
    }
    if(!gameOver){
    ball.jump();
    }
  }
}

//Checking if the ball touch the blocks
  boolean hitBlock(Ball ball,  Block block){
  float ballLeft = ball.pos.x - ball.radius;
  float ballRight = ball.pos.x + ball.radius;
  float ballTop = ball.pos.y - ball.radius;
  float ballBottom = ball.pos.y + ball.radius;
  
  float blockLeft = block.pos.x;
  float blockRight = block.pos.x + block.w;
  float blockTop = block.pos.y;
  float blockBottom = block.pos.y + block.h;
  
  return(ballRight > blockLeft &&
      ballLeft < blockRight &&
      ballBottom > blockTop &&
      ballTop < blockBottom);
      }
