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
  //println(time);

//millisekunder defineres og sættes til at have 3 decimaler som vises på skærmen
  int millis=(time % 1000);
  String Millis = nf(millis, 3);
  text(Millis, 170, 50);
  
//sekunder defineres og sættes til at have 2 decimaler som vises på skærmen
  int sekunder=((time / 1000) % 60);
  String Sekunder = nf(sekunder, 2);
  text(Sekunder + ":", 140,50);
  
//minutter defineres og sættes til at have 2 decimaler som vises på skærmen
  int minutter=((time/ (1000*60)) % 60);
  String Minutter = nf(minutter, 2);
  text(Minutter + ":", 110,50);
  
} 


void keyPressed(){
  
  if (key == 's'){
    println("sussi");
  }
  else if (key == 'b'){
    println("bakki");
  }
  
}
