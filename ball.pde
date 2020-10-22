class ball
{
  
  
  float spin;
  float size = 40;
  int difficulty;
  int numPlayers;
  PVector position = new PVector(0,0);
  PVector velocity = new PVector(0,0);;
  int[] score = new int[4];
  float speed = 0;

  ball(int diff, int numPlayersIn)
  {
    
    
    
    difficulty = diff;
    numPlayers = numPlayersIn;
    reset();
    
    
    
  }
  void reset() //resets ball after each point scored
  {
   float angle = random(TWO_PI);
   
   if(difficulty == 1)speed =5;
    else if(difficulty == 2)speed = 10;
    velocity.x = speed * cos(angle);
    velocity.y = speed * sin(angle);
    if(numPlayers ==2 && velocity.x < 3 && velocity.x > -3) //prevents vertical balls in 2 player mode
    velocity.x = 6;
    position.y = height/2;
    position.x = width/2;
    
  }
  void move()//moves ball
  {
    
    position.add(velocity);
    
  }
  void checkCollision(int numPlayers) //checks for collisions using number of players for if loops and for scenery
  {
      //for adding score
      if(position.x < size/2 && numPlayers <= 2)
      {
        score[0] ++;
        reset();
      }else if(position.x > width - size/2 && numPlayers == 2)
      {
        score[1] ++;
         reset();
      }else if (position.x < size/2)
      {
        score[0] ++;
         reset();
      }else if (position.x > width - size/2)
      {
        score[1] ++;
         reset();
      }else if (position.y < 0 && numPlayers > 2)
      {
        score[2] ++;
         reset();
      }else if (position.y > height - size/2 && numPlayers > 3)
      {
        score[3] ++;
         reset();
      }
      
      
      if(position.x > width - size/2 -100 && numPlayers == 1)
      {
        velocity.x *= -1;
        speed *= 1.1;
      }
      //top and bottom bounces
     if(position.y > height - size/2 || position.y  < size/2 && numPlayers < 3)  
      {
        
        velocity.y *= -1;
      }
      if(position.y > height - size/2 - 50 && numPlayers == 3)
      {
      velocity.y *= -1;
      
      //if it bounces in the corners in 3 & 4 player mode
      }if(numPlayers == 4 && (position.y < 50 + size/2 || position.y > height - 50 - size/2 )&& ((position.x > 0 && position.x < 200) ||(position.x > 800 && position.x < 1000)))
      {
        if(position.y<45+size/2 || position.y > height - 45 - size/2)
        velocity.x *=-1;
        else
        velocity.y *= -1;
      }else if(numPlayers == 3 && position.y < 50 + size/2 && ((position.x > 0 && position.x < 200) ||(position.x > 800 && position.x < 1000)))
      {
        if(position.y<45+size/2)
        velocity.x *=-1;
        else
        velocity.y *= -1;
      }
      
      
      //maps where the ball hits the paddle to replicate the physics in the original pong game
      for(int i = 0; i < numPlayers; i++)
      {
        // work on collisions
        if(abs(position.x - paddle[i].position.x) < size/2 +20 && position.y < paddle[i].position.y +90 && position.y > paddle[i].position.y - 90 && paddle[i].rotation == 0)
        {
          float r = 0;
          float dist = position.y - (paddle[i].position.y-90);
          
          r = radians(45);
          float angle = map(dist,0,180,-r,r);
          
          if(i==0){
          velocity.x = speed*cos(angle);
          velocity.y = speed*sin(angle);
          }else if(i==1){
          velocity.x = -speed*cos(-angle);
          velocity.y = -speed*sin(-angle); 
          
          speed *= 1.1;
          } 
        }else if(abs(position.y - paddle[i].position.y) < size/2 +20 && position.x < paddle[i].position.x +90 && position.x > paddle[i].position.x - 90)
        {
          float r = 0;
          float dist = position.x - (paddle[i].position.x-90);
          
          r = radians(45);
          float angle = map(dist,0,180,-r,r);
          
          if(i==2){
          velocity.y = speed*cos(angle);
          velocity.x = speed*sin(angle);
          }else if(i==3){
          velocity.y = -speed*cos(-angle);
          velocity.x = -speed*sin(-angle); 
          
          speed *= 1.1;
        }
      }
      }
      
  }
  
  void drawBall() //making ball
  {
    
      fill(20,70,140);
      ellipseMode(CENTER);
      ellipse(position.x, position.y, size,size);
    
  }//this was going to be to prvent unprepardness but replaced it with the help menu at the start
  /*boolean timer(boolean start)
  {
    if(start)
    {
      fill(125, 70);
      textAlign(CENTER);
      text("3", width/2, height/2);
      delay(1000);
      text("2", width/2, height/2);
      delay(1000);
      text("1", width/2, height/2);
      delay(1000);
    }
    return false;
  }*/ 
  
}