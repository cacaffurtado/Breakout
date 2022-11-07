class Bola {
  //VARIÁVEIS DA BOLA
  float d; //Diâmetro
  float r; //Raio

  float bX, bY; //Posição X e Y

  float vX, vY; //Velocidade no eixo X e no eixo Y

  boolean move; //Autoriza o movimento

  //CONSTRUCTOR
  Bola() { //Posição Inicial
    d = width/40;
    r = d/2;

    bX = mouseX;
    bY = height - height/10;

    vX = 3;
    vY = -5;

    move = false;
  }

  //METHODS
  //update
  void update() {
    if (move == true) {
      bX += vX;
      bY += vY;

      //Colide com as paredes (cima e laterais)
      if (bX <= r || bX >= width - r) {
        vX *= -1;
      }
      if (bY <= r) {
        vY *= -1;
      }
      //Colide com o chão
      if (bY > height) {
        move = false;
        vida--;
      }
    } else { //No 'move = false', a bola acompanha o bastão
      bY = height - height/10;
      bX = mouseX;

      //Garante que a bola fique no centro do bastão
      if (bX >= width - bastao.w/2) {
        bX = width-bastao.w/2;
      } else if (bX < bastao.w/2) {
        bX = bastao.w/2;
      }
    }
  }

  void colisaoBastao() {
    if (bY > bastao.bY - d && bY< bastao.bY + d &&
      bX > bastao.bX - bastao.w/2 && bX < bastao.bX + bastao.w/2) {
      vY *= -1;

      vX += (bX - mouseX)/20;
      // mouseX é o centro do bastão, logo, se 'bX' é maior, a velocidade
      // continua no mesmo sentido. Porém, se 'bX' é menor, a velocidade
      // troca de sentido.

      // Equilibra velocidade
      if (vX > 8) {
        vX = 8;
      }
      if (vX < -8) {
        vX = -8;
      }
      //Se ganhar velocidade na horizontal, perde velociade na vertical
      if (vX < 0) {
        vY = -12 - vX;
      } else if (vX < 0) {
        vY = -12 +vX;
      }
    }
  }

  //display
  void display() {
    fill(0, 255, 255);
    ellipse(bX, bY, d, d);
    fill(100, 150, 255);
    ellipse(bX, bY, d-10, d-10);
  }
}
