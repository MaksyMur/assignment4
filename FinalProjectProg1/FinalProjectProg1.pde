Ball ball;

float groundY = 360;

void setup(){
size(400, 400);  

ball = new Ball(60, groundY - 20);
}

void draw(){
  background(#B7A6B6);
  
  //Ground
  noStroke();
  fill(#204988); //colour for Ground
  rect(0, 360, 400, 40);
  
  ball.update();
  ball.display();
}

void keyPressed(){
  if(key == ' '){
    ball.jump();
  }
}
