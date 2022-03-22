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
//laver int time til millisekunder ved at konvertere framecount (60 pr sekund, til 1000 pr sekund)
  int time=startvalue+frameCount*(16+2/3);
  println(time);
  int millis=(time % 1000);
  String Millis = nf(millis, 3);
  text(Millis, 170, 50);
  int sekunder=((time / 1000) % 60);
  String Sekunder = nf(sekunder, 2);
  text(Sekunder + ":", 140,50);
  int minutter=((time/ (1000*60)) % 60);
  String Minutter = nf(minutter, 2);
  text(Minutter + ":", 110,50);
  
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
