//startværdien bruges til at kunne modificere starttiden
int startvalue=0;
// i setup vælges størrelsen af canvas, samt textstørrelsen og farve
void setup(){
  size (500,500);
  textSize(50);
  fill(0);
}

void draw(){
  //den laver en ny baggrund efter hver iteration for at tallene ikke "stacker"
  background(225);
  //printer funktionen for tid ud på skærmen
  text(Beregntid(),width/2-100,height/2);
} 


void keyPressed(){
  
  if (key == 's'){
    println("sussi");
  }
  else if (key == 'b'){
    println("bakki");
  }
  
}

String Beregntid (){
  String tid;
//laver int time til millisekunder ved at konvertere framecount (60 pr sekund, til 1000 pr sekund)
  int time=frameCount*(16+2/3)-freezetime;
  //println(time);

//millisekunder defineres og sættes til at have 3 decimaler som vises på skærmen
  int millis=(time % 1000);
  String Millis = nf(millis, 3);
  
  
//sekunder defineres og sættes til at have 2 decimaler som vises på skærmen
  int sekunder=((time / 1000) % 60);
  String Sekunder = nf(sekunder, 2);
  
  
//minutter defineres og sættes til at have 2 decimaler som vises på skærmen
  int minutter=((time/ (1000*60)) % 60);
  String Minutter = nf(minutter, 2);
tid=Minutter + ":" + Sekunder + ":" + Millis;
return tid;
}
