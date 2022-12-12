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
  }
}

void mostraScore() {
  textFont(fonte2);
  textSize(20);
  fill(255);
  text("SCORE: " + score, width/15, height-height/70);
}
