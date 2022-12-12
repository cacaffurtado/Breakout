class Powerup {
  // VARIÁVIES DO POWER-UP
  float d; //Diâmetro
  float r; //Raio

  float bX, bY; //Posição X e Y

  float vX, vY; //Velocidade no eixo X e no eixo Y

  boolean move; //Autoriza o movimento

  boolean estadoPowerup;

  boolean fogo;
  int tempo;

  // CONSTRUCTOR

  Powerup() {
    d = width/30;
    r = d/2;

    bX = width/2;

    //Posição Inicial
    bY = bloco[0][0].bY ;

    vX = 1;
    vY = 3;

    estadoPowerup = true;
    move = false;

    fogo = false;
    tempo = 0;
  }

  // METHODS
  // update
  void update() {
    if (estadoPowerup) {
      move = true;
    }

    if (move) {
      bX += vX;
      bY += vY;

      //Colide com as paredes (cima e laterais)
      if (bX <= r || bX >= width - r) {
        vX *= -1;
      }

      //Colide com o chão
      if (bY <= r || bY >= height - r) {
        vY *= -1;
      }
    }

    if (fogo) {
      bola.c2 = color(255, 0, 0);
      bastao.c1 = color(255, 0, 0);
      bastao.c2 = color(200, 100, 100);
      tempo++;
      if (tempo >= 90) {
        bola.c2 = color(0, 255, 255);
        bastao.c1 = color(255, 0, 255);
        bastao.c2 = color(150);
        fogo = false;
        tempo = 0;
      }
    }
  }

  //display
  void display1() {
    if (NEXT == false && estadoPowerup) {
      fill(0, 255, 0);
      ellipse(bX, bY, d, d);
      fill(100, 255, 150);
      ellipse(bX, bY, d-10, d-10);
    }
  }

  void display2() {
    if (NEXT == false && estadoPowerup) {
      fill(255, 0, 0);
      ellipse(bX, bY, d, d);
      fill(255, 150, 100);
      ellipse(bX, bY, d-10, d-10);
    }
  }
}
