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
    d = width/40;
    r = d/2;

    //Posição Inicial
    bX = bloco[auxX][auxY].bX/2 ;
    bY = bloco[auxX][auxY].bY/2 ;

    println(bX, bY);

    vX = 3;
    vY = 5;

    estadoPowerup = false;
    move = false;
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


  void colisaoBastao() {
    if (bY > bastao.bY - d && bY< bastao.bY + d &&
      bX > bastao.bX - bastao.w/2 && bX < bastao.bX + bastao.w/2) {
      move = false;
      estadoPowerup = false;
    }
  }

  void colisaoBola() {
    if (bY > bastao.bY - d && bY< bastao.bY + d &&
      bX > bastao.bX - bastao.w/2 && bX < bastao.bX + bastao.w/2) {
      move = false;
      estadoPowerup = false;

      //bolaFogo = true;
    }
  }

  //display
  void display() {
    if (estadoPowerup) {
      fill(0, 255, 255);
      ellipse(bX, bY, d, d);
      fill(100, 150, 255);
      ellipse(bX, bY, d-10, d-10);
    }
  }
}
