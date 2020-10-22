class paddle
{
  PVector position;
  PVector velocity;
  int rotation;
  int key1;
  int key2;
  int R;
  int G;
  int B;
  boolean key1Move;
  boolean key2Move;
  boolean appear;
  
  //uses many inputs from the players array to determine position, colour, keys
  paddle(int player, int numPlayers, String colour, String key1In, String key2In)
  { 
    
    position = new PVector(0,0);
    velocity = new PVector(0,0);
    if(player == 0 && numPlayers <=2)
    {
      position.x = 40;
      position.y = height/2 ;
      rotation = 0;
    }else if(player == 0 && numPlayers >2)
    {
      position.x = 180;
      position.y = height/2 ;
      rotation = 0;
    }else if(player == 1 && numPlayers <=2)
    {
      position.x = 960;
      position.y = height/2 ;
      rotation = 0;
    }else if(player == 1 && numPlayers >2)
    {
      position.x = 820;
      position.y = height/2;
      rotation = 0;
    }else if(player == 2)
    {
      position.x = width/2 ;
      position.y = 30;
      rotation = 90;
    }else if(player == 3)
    {
      position.x = width/2;
      position.y = 670;
      rotation = 90;
    }
      if(colour.equals("red"))
      {
        R =244;
        G =66;
        B =72;
      }else if(colour.equals("blue"))
      {
        R =65;
        G =110;
        B =244;
      }else if(colour.equals("green"))
      {
        R =65;
        G =244;
        B =79;
      }else if(colour.equals("yellow"))
      {
        R =244;
        G =232;
        B =65;
      }else if(colour.equals("purple"))
      {
        R =151;
        G =65;
        B =244;
      }
      
      
      key1 = key1In.charAt(0);
      key2 = key2In.charAt(0);
    }
  void show() //draws the paddle
  {
    rectMode(CENTER);
    noStroke();
    if(rotation == 90 )
    {
      fill(R,G,B);
      rect(position.x, position.y, 180, 40);
    }else {
    fill(R,G,B);
    rect(position.x,position.y,40,180);
  }
  }
  
  void move(int numPlayers) //moves & restricts the paddle and checks if it makes sense with the number of players
  {
   
    
    if(key1Move && (rotation == 0 || rotation == 180) && position.y > 90 && numPlayers <3)
    {
      velocity.y = -10;
    }
    else if(key1Move && (rotation == 0 || rotation == 180) && position.y > 140)
    {
      velocity.y = -10;
     }
    if(key2Move && (rotation == 0 || rotation == 180) && position.y < height - 90 && numPlayers <3)
    {
      velocity.y = 10;
    }else if(key2Move && (rotation == 0 || rotation == 180) && position.y < height - 140)
    {
      velocity.y = 10;
    }
    if(key1Move && (rotation == 90 || rotation == 270) && position.x > 290)
    {
      velocity.x = -10;
    }if(key2Move && (rotation == 90 || rotation == 270) && position.x < 710)
    {
      velocity.x = 10;
    }
    
    position.add(velocity);
    
    velocity.y = 0;
    velocity.x = 0;
  
  }
  
  
  
  // used to move paddles and allow for multiple keys to be pressed
  boolean keysPressed(char k, boolean b, int key1, int key2)
  {
     k = Character.toLowerCase(k);
    if(k == key1)return key1Move = b;
    else if(k == key2) return key2Move = b;
    return b;
      
    }
    
     
     
     
  
  
  
  
  
  }