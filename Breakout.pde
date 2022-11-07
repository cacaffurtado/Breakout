Bola bola; //Declara que teremos um objeto 'bola' da classe 'Bola'
Bastao bastao; //Declara que teremos um objeto 'bastao' da classe 'Bastao'
Bloco[][] bloco; //Declara que teremos um array 'bloco' da classe 'Bloco'

int l, c;
int score, nivel, vida;

PFont fonte1, fonte2;
PImage coracao;

final int MENU = 0;
final int JOGO = 1;

int estadoTela = 0;

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

  criaNivel(c, l);
}

void draw() {
  if (estadoTela == MENU) {
    mostraMenu();
  } else if (estadoTela == JOGO) {
    mostraJogo();
  }
}

void mostraMenu() {
  background(0);
  textFont(fonte1);
  textSize(100);
  fill(255);
  text("BREAKOUT", width/2, height/2);

  textFont(fonte2);
  textSize(30);
  fill(255);
  text("PRESS TO START", width/2, 3*height/5);

  textSize(20);
  fill(255);
  text("github.com/cacaffurtado", width - width/7, height - height/60);

  if (mousePressed) {
    estadoTela = JOGO;
  }
}

void mostraJogo() {
  background(0);
  mostraVida();
  if (vida > 0) {
    mostraScore();
    confereNivel();
    mostraBlocos();

    bola.update(); //Atualiza a posição da bola;
    bola.colisaoBastao(); //Atualiza a posição de acordo com colisão no bastão;
    bola.display(); //Vai até 'bola' e chama o 'display()' da classe para o objeto

    bastao.update(); //Atualiza a posição X e Y do bastão;
    bastao.display(); //Vai até 'bastao' e chama o 'display()' da classe para o objeto
  }
}

void criaNivel(int l, int c) {
  bola = new Bola(); //O 'new' chama o constructor 'Bola'

  bastao = new Bastao(); //O 'new' chama o constructor 'Bastao'

  bloco = new Bloco[l][c]; //O 'new' chama o constructor 'Bloco'
  for (int i = 0; i < bloco.length; i++) { //D
    for (int j = 0; j < bloco[0].length; j++) { //D
      bloco[i][j] = new Bloco(i, j+2, bloco.length);
    }
  }
}

boolean blocosRestantes() { //Checar a existência de algum bloco
  for (int i = 0; i < bloco.length; i++) {
    for (int j = 0; j < bloco[0].length; j++) {
      if (bloco[i][j].estadoBloco) {
        return true;
      }
    }
  }
  return false;
}

void gameOver() {
  background(0);

  textFont(fonte2);

  textSize(100);
  fill(255, 0, 0);
  text("GAME OVER", width/2, height/2);

  textSize(30);
  fill(255);
  text("SCORE: " + score, width/2, 3*height/5);

  textSize(20);
  text("PRESS TO RESTART", width/2, 4*height/5);

  if (mousePressed) {
    setup();
  }
}


void mostraVida() {
  textFont(fonte2);
  textSize(20);
  fill(255);
  if (vida == 3) {
    image(coracao, width - width/8, height-height/18, 40, 40);
    image(coracao, width - width/11, height-height/18, 40, 40);
    image(coracao, width - width/18, height-height/18, 40, 40);
  } else if (vida == 2) {
    image(coracao, width - width/8, height-height/18, 40, 40);
    image(coracao, width - width/11, height-height/18, 40, 40);
  } else if (vida == 1) {
    image(coracao, width - width/8, height-height/18, 40, 40);
  } else if (vida == 0) {
    gameOver();
  }
}

void mostraScore() {
  textFont(fonte2);
  textSize(20);
  fill(255);
  text("SCORE: " + score, width/15, height-height/70);
}

void next() {
  textFont(fonte2);
  textSize(20);
  fill(255);
  text("PRESS TO CONTINUE", width/2, 2*height/3);

  if (mousePressed) {
    nivel++;
    if (nivel%2==0) {
      c++;
    } else {
      l++;
    }
    criaNivel(l, c);
  }
}

void confereNivel() {
  int n = nivel+1;
  textFont(fonte2);
  textSize(100);
  fill(30);
  text("LEVEL " + n, width/2, height/2);
  if (!blocosRestantes()) {
    bola.move = false;
    next();
  }
}

void mostraBlocos() {
  for (int i = 0; i < bloco.length; i++) {
    for (int j = 0; j < bloco[0].length; j++) {
      bloco[i][j].colisaoBola(bola); //Atualiza o estado do bastão de acordo com colisão com a bola;
      bloco[i][j].display(); //Posiciona cada bloco de acordo com a posição indicada
    }
  }
}

void mousePressed () {
  if (bola.move == false) {
    //Assegura que, TODA VEZ que a bola partir do bastão, ela irá PARA CIMA!
    bola.bY -= 5;
    bola.bX = mouseX;
    bola.move = true;
  }
}
