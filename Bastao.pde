class Bastao {
  //VARIÁVEIS DO BASTÃO
  float w, h; //Largura e altura
  float bX, bY; //Posição X e Y

  float vX, vY; //Velocidade no eixo X e no eixo Y

  //CONSTRUCTOR
  Bastao() {
    w = width/5;
    h = height/70;

    bX = mouseX;
    bY = height - height/15;

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

  //display
  void display() {
    fill(255, 0, 255);
    rect(bX - w/2 -3, bY-3, w+6, h+6, 8);
    fill(150);
    rect(bX-w/2, bY, w, h, 8);
    fill(255);
    rect(bX-w/2+3, bY+3, w-6, h-6, 8);
  }
}
