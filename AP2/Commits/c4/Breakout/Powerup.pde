int [] x2 = {200, 600};
int [] x3 = {133, 399, 665};
int [] x4 = {100, 300, 500, 700};

class Powerup {
  // VARIÁVIES DO POWER-UP
  float d; //Diâmetro
  float r; //Raio

  float bX, bY; //Posição X e Y

  float vX, vY; //Velocidade no eixo X e no eixo Y

  boolean move; //Autoriza o movimento

  boolean estadoPowerup;

  boolean fogo, bastaoAumenta;
  int tempo1, tempo2;

  // CONSTRUCTOR

  Powerup() {
    d = width/30;
    r = d/2;

    bX = width/2;


    //Posição Inicial
    bY = bloco[0][0].bY ;

    //println(bX, bY);

    vX = 1;
    vY = 3;

    estadoPowerup = true;
    move = false;

    bastaoAumenta = false;
    fogo = false;
    tempo1 = 0;
    tempo2 = 0;
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
    } else {
    }
  }

  void colisaoBastao2() {
    if (bola.move && !fogo) {
      if (bY > bastao.bY - d && bY< bastao.bY + d &&
        bX > bastao.bX - bastao.w/2 && bX < bastao.bX + bastao.w/2) {
        move = false;
        estadoPowerup = false;
        fogo = true;
      }
    }
  }

  void Fogo() {
    if (fogo) {
      tempo2++;
      println(tempo2);
      if (tempo2 >= 90) {
        tempo2 = 0;
        fogo = false;
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
