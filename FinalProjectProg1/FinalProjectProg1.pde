float groundHeight = 40;
float groundY = height - groundHeight;

void setup(){
size(400, 400);  
}

void draw(){
  background(#B7A6B6);
  
  noStroke();
  fill(#204988); //colour for ground
  rect(0, groundY, width, groundHeight);
 
  
}
