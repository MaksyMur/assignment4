// obstacles to avoid

class Block{
  
  PVector pos;
  PVector vel;
  float w = 40;
  float h = 120;
  
  boolean isTop;
  
  //starting position
  Block(float x, boolean isTopBlock){
    pos = new PVector(x, 0);
    vel = new PVector(-3, 0); //move left
    
    isTop = isTopBlock;
    
    
    //set correct starting point
    if(isTop){
      pos.y = 0;
    }else{
      pos.y = groundY - h;
    }
  }
  
  void update(){
    pos.add(vel);
    
    //if the blocks off screen then to reset to right
    if(pos.x + w < 0){
      pos.x = width + 100;
      
      //reset again
      if(isTop){
      }else{
        pos.y = groundY - h;
      }
    }
  }
  
  void display(){
    fill(#32327C);
    rect(pos.x, pos.y, w, h);
  }
}
