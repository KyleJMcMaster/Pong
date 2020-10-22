//extrememly useful - checks if mouse is over a location by taking the start X and Y
//and using the width and height
//returns wether or not the mouse is over

boolean mouseOver(double x, double y, double w, double h)  
{
  if(mouseX>x && mouseX<x+w && mouseY>y && mouseY <y+h)
  return true;
  else
  return false;
}
//used in the text box, takes char array and length and returns string
String nameCombined(char[] name, int nameLength)
{
  String combined = "";
for( int i = 0; i < nameLength; i++)
{
  combined += name[i];
  
}
return combined;
}

paddle[] makePaddles(int numPlayers) //method to make paddles, uses numPlayers to know how many and returns a paddle array
{
  paddle[] paddle = new paddle[4];
  for(int i = 0; i < numPlayers; i++)                          //making paddles  
  {
    
   paddle[i] = new paddle(i,numPlayers, players[i][1], players[i][2] , players[i][3]);
  }
return paddle;
}

ball[] makeBalls(int balls)//same idea as to above, i was going to make multiple balls be an option but scrapped the idea
{
  ball[] ball = new ball[2];
  for(int i = 0; i < balls; i++)                          //balls 
  {
    
  ball[i] = new ball(difficulty, numPlayers);
  }
return ball;
}

 
    