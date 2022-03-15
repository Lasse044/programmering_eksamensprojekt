//startværdien bruges til at kunne modificere starttiden
int startvalue=0;

// i setup vælges størrelsen af canvas, samt textstørrelsen og farve
void setup(){
  size (500,500);
  textSize(20);
  fill(0);
}

void draw(){
//den laver en ny baggrund efter hver iteration for at tallene ikke "stacker"
  background(225);
  int time=startvalue+frameCount/60;
  println(frameCount);
  int millis=(frameCount);
  text("millisekunder: "+millis, 100, 50);
  int sekunder=(time % 60);
  text("sekunder: "+sekunder, 100,100);
  int minutter=(time/60);
  text("minutter: "+minutter, 100,200);
  
  /*
  text("sekunder: ")
  
  text("sekunder: "+sekunder,100,100);
  text("minutter: "+m,200,100);
  if(sekunder>59){
    frameCount=0;
    m++;
  }
  */
}
