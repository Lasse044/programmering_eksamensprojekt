// her defineres variablerne i starten af programmet, til timeren
boolean mystart =false;
boolean idletime =true;
boolean solved =false;
int freezetime=0;
String solvetid;
String tid;

// her defineres variable vedrørende scramble-sekvensen
import java.util.HashSet;
String[]x = {"F", "B", "U", "D", "R", "L"};
String[]x1 = {"", "'", "2"};
ArrayList<String> traek = new ArrayList<String>();
ArrayList<Integer> temp = new ArrayList<Integer>();
HashSet<Integer> ens = new HashSet<Integer>();
int laengde = 0;
int tal;
int i = 0;

// i setup vælges størrelsen af canvas, samt textstørrelsen og farve
void setup() {
  size(1500,550);
  //noLoop();
  //size (500, 500);
  textSize(100);
  fill(0);
 
}

void draw() {
  //den laver en ny baggrund efter hver iteration for at tallene ikke "stacker"
  background(225);
  //printer funktionen for tid ud på skærmen, hvis mystart er sand, ellers står timeren på 0
    textSize(100);
  //når idletime er sand vil tiden stå stille på 0 og scramble vil være synlig
  if (idletime == true) {
    textSize(100);
    text("00:00:000", width/2-210, height/2+80);
    textSize(50);
    text("Press [S] to start timer", width/2-230, height/2-50);
    scramble();
  }
  //når mystart er sand vil tiden være i gang
  if (mystart == true) {
    textSize(100);
    text(Beregntid(), width/2-210, height/2+80);
    textSize(50);
    text("Press [SPACE] to stop timer", width/2-270, height/2-50);
  }
  //når solved er sand vil tiden fryses
  if (solved == true) {
    textSize(100);
    text(solvetid, width/2-210, height/2+80);
    textSize(50);
    text("Press [R] to reset timer", width/2-230, height/2-50);
  }
} 

void scramble() {
//vælger tilfældigt 21 træk af de 6 mulige i array x, samt udeller hvert træk enten ', 2 eller ingenting fra array x1
 for (int j = 0; j < 21; j++) {
    tal = int(random(6));
    ens.add(tal);
    laengde++;
 
    while (ens.size() != laengde) {
      tal = int(random(6));
      ens.add(tal);
    }
    temp.add(tal);
    traek.add(x[tal]+x1[int(random(3))]);
    
    if (ens.size() == 2) {
      ens.remove(temp.get(i));
      i++;
      laengde--;
    }
  }
  //her vises scramble-sekvensen på skærmen ved at printe hver del af array treak ud
  textSize(40);
  fill(40,90,140);
  for(int i=0;i<traek.size();i++){
  text(traek.get(i),30+i*70,100);
  }
  {
//overskrift
    fill(256,0,0);
  text("WCA STANDARD 3x3 SCRAMBLE",width/2-280,50);
  fill(0);
  }
}

//funktion som beregner sekunder, millisekunder og minutter
String Beregntid () {
  //laver int time til millisekunder ved at konvertere framecount (60 pr sekund, til 1000 pr sekund)
  //og trækker tiden framecounten før timeren blev startet fra
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

void keyPressed() {
//hvis man trykker på knappen s, sættes mystart til sand og timeren starter
  if (key == 's') {
    freezetime=frameCount;
    idletime=false;
    mystart=true;
    solved=false;
  } 
//hvis man trykker på mellemrumsknappen, stopper timeren og tiden sættes til en ny variabel som vises på skærmen
  else if (key == ' '){
    mystart=false;
    idletime=false;
    solvetid=tid;
    solved=true;
//hvis man trykker på r knappen, resetter timeren tilbage til 0 og er klar igen
  }
  else if (key == 'r'){
    mystart=false;
    idletime=true;
    solved=false;
  }
}
