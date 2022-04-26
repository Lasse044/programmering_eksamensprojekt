// her defineres variablerne i starten af programmet
boolean mystart =false;
boolean idletime =true;
int freezetime=0;
String solvetid;

// i setup vælges størrelsen af canvas, samt textstørrelsen og farve
void setup() {
  size (500, 500);
  textSize(50);
  fill(0);
}

void draw() {
  //den laver en ny baggrund efter hver iteration for at tallene ikke "stacker"
  background(225);
  //printer funktionen for tid ud på skærmen, hvis mystart er sand, ellers står timeren på 0
  if (idletime == true) {
    text("00:00:000", width/2-100, height/2);
  }
  if (mystart == true) {
    text(Beregntid(), width/2-100, height/2);
  }
}

//funktion som beregner sekunder, millisekunder og minutter
String Beregntid () {
  String tid;
  //laver int time til millisekunder ved at konvertere framecount (60 pr sekund, til 1000 pr sekund)
  int time=(frameCount-freezetime)*(16+2/3);

  //millisekunder defineres og sættes til at have 3 decimaler som vises på skærmen
  int millis=(time % 1000);
  String Millis = nf(millis, 3);


  //sekunder defineres og sættes til at have 2 decimaler som vises på skærmen
  int sekunder=((time / 1000) % 60);
  String Sekunder = nf(sekunder, 2);


  //minutter defineres og sættes til at have 2 decimaler som vises på skærmen
  int minutter=((time/ (1000*60)) % 60);
  String Minutter = nf(minutter, 2);
  
  //de forskellige strings sættes sammen til en samlet string og retuneres
  tid=Minutter + ":" + Sekunder + ":" + Millis;
  return tid;
  
}
//hvis man trykker på knappen s, sættes mystart til sand og timeren starter
void keyPressed() {

  if (key == 's') {
    freezetime=frameCount;
    idletime=false;
    mystart=true;
  } 
  else if (key == ' '){
    mystart=false;
    idletime=false;
  }
}
