class Bastao {
  //VARIÁVEIS DO BASTÃO
  float w, h; //Largura e altura
  float bX, bY; //Posição X e Y

  float vX, vY; //Velocidade no eixo X e no eixo Y

  color c1, c2;

  //CONSTRUCTOR
  Bastao() {
    w = width/5;
    h = height/70;

    bX = mouseX;
    bY = height - height/13;

    c1 = color(255, 0, 255);
    c2 = color(150);

    vX = 3;
    vY = -5;
  }

  //METHODS
  //update
  void update() {
    bX = mouseX;

    //Garante que o bastão fique dentro da janela
    if (bX >= width - w/2) {
      bX = width - w/2;
    } else if (bX < w/2) {
      bX = w/2;
    }
  }

  void colisaoPowerup(Powerup x) {
    if (bola.move && x.estadoPowerup) {
      if (x.bY > bY - x.d && x.bY< bY + x.d &&
        x.bX > bX - w/2 && x.bX < bX + w/2) {
        x.move = false;
        x.estadoPowerup = false;
        w += 50;
        c1 = color(0, 255, 0);
        c2 = color(100, 200, 100);
      }
    }
  }

  void colisaoFogo(Powerup x) {
    if (bola.move && x.estadoPowerup && x.fogo == false) {
      if (x.bY > bY - x.d && x.bY< bY + x.d &&
        x.bX > bX - w/2 && x.bX < bX + w/2) {
        x.move = false;
        x.estadoPowerup = false;
        x.fogo = true;
      }
    }
  }

  //display
  void display() {
    fill(c2);
    rect(bX - w/2 -3, bY-3, w+6, h+6, 8);
    fill(255);
    rect(bX-w/2, bY, w, h, 8);
    fill(c1);
    rect(bX-w/2+3, bY+3, w-6, h-6, 8);
  }
}
