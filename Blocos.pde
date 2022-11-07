class Bloco {
  //VARIÁVEIS DOS BLOCOS
  float w, h; //Largura e altura

  float n; //Número de blocos

  float bX, bY; //Posição X e Y

  int r, g, b; //Cores

  //int aux;

  boolean estadoBloco;

  //CONSTRUCTOR
  Bloco(int c, int l, int numeroBlocos) {
    n = numeroBlocos;
    w = width/n;
    h = height/25;
    bX = w * c;
    bY = h * l;
    cores(c, l); //Determinar cores de acordo com sua posição
    //aux = 0;
    estadoBloco = true;
  }

  //METHODS
  //cores DESIGN
  void cores(int c, int l) {
    b = 255;

    if (c%9 == 0) {
      r = 150;
    } else if (c%9 == 1) {
      r = 200;
    } else if (c%9 == 2) {
      r = 250;
    } else if (c%9 == 3) {
      r = 200;
    } else if (c%9 == 4) {
      r = 150;
    } else if (c%9 == 5) {
      r = 200;
    } else if (c%9 == 6) {
      r = 250;
    } else if (c%9 == 7) {
      r = 200;
    } else if (c%9 == 8) {
      r = 150;
    }

    if (l%2 == 0) {
      b = 70;
      g= 150;
    }
  }

  //colisaoBola
  void colisaoBola(Bola bola) {
    if (estadoBloco) {
      //BAIXO
      if (bola.bX > bX && bola.bX < (bX+w) && bola.bY > (bY+h) && bola.bY < (bY+h+bola.d) ) {
        bola.vY *= -1;
        estadoBloco = false;
        score += 10;
        //aux++;
        //println(aux);
        //if (aux == 2) {
        //}
      }

      //ESQUERDA
      if (bola.bX > (bX-bola.d) && bola.bX < bX && bola.bY > bY && bola.bY < (bY+h) ) {
        bola.vX *= -1;
        estadoBloco = false;
        score += 10;
      }

      //DIREITA
      if (bola.bX > (bX+w) && bola.bX < (bX+w+bola.d) && bola.bY > bY && bola.bY < (bY+h) ) {
        bola.vX *= -1;
        estadoBloco = false;
        score += 10;
      }

      //CIMA
      if (bola.bX > bX && bola.bX < (bX+w) && bola.bY < bY && bola.bY > (bY-bola.d) ) {
        bola.vY *= -1;
        estadoBloco = false;
        score += 10;
      }
    }
  }

  //display
  void display() {
    fill(r/2, g/2, b/2);
    if (estadoBloco) {
      rect(bX, bY, w, h, 10);
      fill(255, 255, 0);
      rect(bX+8, bY+8, w-16, h-16, 2);
      fill(r, g, b);
      rect(bX+10, bY+10, w-20, h-20, 3);
    }
  }
}
