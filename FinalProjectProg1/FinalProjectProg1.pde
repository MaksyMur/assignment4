Ball ball;

Block topBlock;
Block bottomBlock;

float groundY = 360;

boolean gameStarted = false;
boolean gameOver = false;

int score = 0;

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
  
  
    
    //update objects only when the game s running
    if(gameStarted && !gameOver){
      ball.update();
      topBlock.update();
      bottomBlock.update();
      
      
      
      //score from bottom block
      if(!bottomBlock.scored && bottomBlock.pos.x + bottomBlock.w 
      < ball.pos.x - ball.radius){
        score++;
        bottomBlock.scored = true;
      }
      
      
      //if the ball touch the blocks = you lose
      if(hitBlock(ball, topBlock) || hitBlock(ball, bottomBlock)){
        gameOver = true;
      }
    }
  
  ball.display();
  topBlock.display();
  bottomBlock.display();
  
  //score on the top
      fill(255);
      ellipse(50, 25, 70, 35);
      
      fill(#007CA5);
      textAlign(CENTER, CENTER);
      textSize(24);
      text(score, 50, 23);
  
  //when the ball touch the blocks the screen will go red to show that the player lost
  if(gameOver){
    fill(255, 0, 0, 80);
    rect(0, 0, width, height);
  }
  
}

void keyPressed(){
  if(key == ' '){
    
    //if game is over - restart
    if(gameOver){
      resetGame();
      return;
    }
    
    //the game will start on first space press
    if(!gameStarted){
      gameStarted = true;
    }
    
    //if(!gameOver){
    ball.jump();
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
      
      //I want to reset objects after you press space
      void resetGame(){
        gameStarted = false;
        gameOver = false;
        score = 0;
        
        //reset ball
        ball.pos.y = groundY - ball.radius;
        ball.vel.y = 0;
        ball.onGround = true;
        
        //reset blocks
        topBlock.pos.x = 400;
        topBlock.scored = false;
        bottomBlock.pos.x = 600;
        bottomBlock.scored = false;
      }
