void keyReleased() {
  if (key == 'q' && timer > 5) timer-= 5;
  if (key == 'q' && timer == 5) timer = 1;
  if (key == 'w' && timer != 1) timer += 5;
    if (key == 'w' && timer == 1) timer += 4;
  if (key == 'a' &&  maxPoints > 3) maxPoints--;
  if (key == 's') maxPoints++;
  if (key == 'z' && variation > 0) variation-= 5;
  if (key == 'x') variation+= 5;
  if (key == 'd') debug = !debug;
}  
