//player class

class Ball{
  PVector pos;
  PVector vel;
  PVector acc;
  
  float radius = 20; //ball's radius
  boolean onGround = true; //ball standing on the Ground
  
  Ball(float x, float y){
    pos  =  new PVector(x, y); //ball position
    vel = new PVector(0, 0); //ball movement
    acc = new PVector(0, 0.5); //ball gravity
  }
  
  void update(){
    vel.add(acc); //ball falls faster after some time
    pos.add(acc); //up and down
    
    //ball will stop falling on the Ground
    if (pos.y >= groundY - radius){
      pos.y = groundY - radius; //top of the Ground
      vel.y = 0;
      onGround = true;
    }
  }
  
  //draw ball
  void display(){
    fill(#007CA5);
    ellipse(pos.x, pos.y, radius * 2, radius *2);
   }
   
   //you can jump only if you stand on Ground
   void jump(){
     if(onGround){
       vel.y = -12;
       onGround = false;
     }
   }
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
