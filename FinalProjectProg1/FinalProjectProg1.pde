Ball ball;

Block topBlock;
Block bottomBlock;

float groundY = 360;

boolean gameStarted = false;

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
  if(gameStarted){
    topBlock.update();
    bottomBlock.update();
  }
  
  ball.update();
  ball.display();
  
  //topBlock.update();
  topBlock.display();
  //bottomBlock.update();
  bottomBlock.display();
  
}

void keyPressed(){
  if(key == ' '){
    if(!gameStarted){
      gameStarted = true; //the blocks will start moving once you preesed the space key
    }
    ball.jump();
  }
}
