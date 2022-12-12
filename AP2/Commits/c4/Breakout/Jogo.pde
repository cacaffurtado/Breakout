void mostraJogo() {
  background(0);
  fill(50);
  rect(0, height - height/20, width, height/20);
  mostraVida();
  if (vida > 0) {
    mostraScore();
    confereNivel();

    //println(aux);
    println(powerupFogo1.move, powerupBastao1.move, powerupFogo2.move, powerupBastao2.move);

    if (aux >= 1) {
      powerupBastao1.update();
      bastao.colisaoPowerup(powerupBastao1);
      powerupBastao1.display1();
    }
    if (aux >= 3) {
      powerupFogo1.update();
      powerupFogo1.Fogo();
      powerupFogo1.colisaoBastao2();
      powerupFogo1.display2();
    }
    if (aux >= 5) {
      powerupBastao2.update();
      bastao.colisaoPowerup(powerupBastao2);
      powerupBastao2.display1();
    }
    if (aux >= 7) {
      powerupFogo2.update();
      powerupFogo2.Fogo();
      powerupFogo2.colisaoBastao2();
      powerupFogo2.display2();
    }

    mostraBlocos();

    bola.update(); //Atualiza a posição da bola;
    bola.colisaoBastao(); //Atualiza a posição de acordo com colisão no bastão;
    bola.display(); //Vai até 'bola' e chama o 'display()' da classe para o objeto

    bastao.update(); //Atualiza a posição X e Y do bastão;
    bastao.display(); //Vai até 'bastao' e chama o 'display()' da classe para o objeto

    permiteJogo = true;
  } else {
    JOGO = false;
    GAMEOVER = true;
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

  record = splice(record, score, 0);
  mostraRecord = true;
}

void next() {
  textFont(fonte2);
  textSize(20);
  text("PRESS TO CONTINUE", width/2, 2*height/3);

  NEXT = true;
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
