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

  boolean bolaFogo;

  // CONSTRUCTOR

  Powerup() {
    d = width/30;
    r = d/2;

    bX = width/2;


    //Posição Inicial
    bY = bloco[0][0].bY ;

    //println(bX, bY);

    vX = 3;
    vY = 5;

    estadoPowerup = true;
    move = false;
  }

  // METHODS
  // update
  void update() {
    //println(estadoPowerup);

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


  void colisaoBastao1() {
    if (bY > bastao.bY - d && bY< bastao.bY + d &&
      bX > bastao.bX - bastao.w/2 && bX < bastao.bX + bastao.w/2) {
      move = false;
      estadoPowerup = false;
    }
  }

  void colisaoBastao2() {
    if (bY > bastao.bY - d && bY< bastao.bY + d &&
      bX > bastao.bX - bastao.w/2 && bX < bastao.bX + bastao.w/2) {
      move = false;
      estadoPowerup = false;
    }
  }

  //display
  void display1() {
    if (NEXT == false && estadoPowerup) {
      fill(255, 0, 0);
      ellipse(bX, bY, d, d);
      fill(255, 150, 100);
      ellipse(bX, bY, d-10, d-10);
    }
  }

  void display2() {
    if (NEXT == false && estadoPowerup) {
      fill(0, 255, 0);
      ellipse(bX, bY, d, d);
      fill(100, 255, 150);
      ellipse(bX, bY, d-10, d-10);
    }
  }
}
