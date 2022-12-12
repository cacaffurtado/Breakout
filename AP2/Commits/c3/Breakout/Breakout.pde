Bola bola; //Declara que teremos um objeto 'bola' da classe 'Bola'
Bastao bastao; //Declara que teremos um objeto 'bastao' da classe 'Bastao'
Bloco[][] bloco; //Declara que teremos um array 'bloco' da classe 'Bloco'
Powerup powerupFogo1;
Powerup powerupBastao1;
Powerup powerupFogo2;
Powerup powerupBastao2;

int aux, aux1;

int l, c;
int score, nivel, vida;

PFont fonte1, fonte2;
PImage coracao;

boolean MENU, JOGO, NEXT, GAMEOVER;
boolean permiteJogo;

int [] record = new int[50];
boolean mostraRecord = false;

void setup() {
  size(800, 700);
  textAlign(CENTER);
  frameRate(60);

  fonte1 = createFont("fonte1.otf", 50);
  fonte2 = createFont("fonte2.ttf", 20);
  coracao = loadImage("coracao.png");

  nivel = 0;
  score = 0;
  vida = 3;
  l = 1;
  c = 2;
  aux = 0;

  MENU = true;
  permiteJogo = false;
}

void draw() {
  if (MENU) {
    mostraMenu();
  }
  if (JOGO) {
    mostraJogo();
  }
  if (GAMEOVER) {
    gameOver();
  }
}

void mostraMenu() {
  background(0);
  textFont(fonte1);
  textSize(110);
  fill(0, 255, 255);
  text("BREAKOUT", width/2, height/2);

  textFont(fonte2);
  textSize(30);
  fill(255);
  text("PRESS TO START", width/2, 3*height/5);

  textSize(20);
  fill(255);
  text("github.com/cacaffurtado", width - width/7, height - height/60);

  if (mostraRecord) {
    textSize(20);
    fill(255);
    text("RECORD:  " + max(record), width/2, 5*height/7);
  }

  criaNivel(l, c);
}

void criaNivel(int l, int c) {

  bola = new Bola(); //O 'new' chama o constructor 'Bola'

  bastao = new Bastao(); //O 'new' chama o constructor 'Bastao'

  bloco = new Bloco[c][l]; //O 'new' chama o constructor 'Bloco'

  for (int i = 0; i < bloco.length; i++) { //D
    for (int j = 0; j < bloco[0].length; j++) { //D
      bloco[i][j] = new Bloco(i, j+2, bloco.length);
    }
  }

  powerupFogo1 = new Powerup();
  powerupBastao1 = new Powerup();
  powerupFogo2 = new Powerup();
  powerupBastao2 = new Powerup();
}

void mousePressed () {
  if (MENU) {
    MENU = false;
    JOGO = true;
  }

  if (permiteJogo) {
    if (bola.move == false) {
      //Assegura que, TODA VEZ que a bola partir do bastão, ela irá PARA CIMA!
      bola.bY -= 5;
      bola.bX = mouseX;
      bola.move = true;
    }
  }

  if (NEXT) {
    nivel++;
    if (nivel%2==0) {
      c++;
    } else {
      if (nivel%5 == 0) {
        c++;
        l++;
      } else {
        l++;
      }
    }
    aux = 0;
    println(l, c);

    criaNivel(l, c);
    NEXT = false;
  }

  if (GAMEOVER) {
    GAMEOVER = false;
    MENU = true;
    setup();
  }
}
