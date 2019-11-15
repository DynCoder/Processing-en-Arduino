float x;
IntList y;
float size;
float speed;
float round = 0;
int n = 0;
float prev_speed = 0;
boolean game_over = false;

void new_round() {
  y.clear();
  round++;
  x = width + size;
  size = (round / 2.5) + 15;
  speed = (round % 10) + (size / 5);
  if (speed < prev_speed) n++;
  prev_speed = speed;
  
  for (int i = 0; i < n; i++) {
    y.append(int(random(0, height)));
  }
}

void setup()
{
  y = new IntList();
  size(800,800);
  new_round();
}

void draw ()
{
  if (game_over) {
    background(255,0,0);
  } else {
    background(230,230,230);
    x -= speed;
    for (int i = 0; i < n; i++) {
      ellipse(x, y.get(i), size, size);
      float dist = sqrt(pow(mouseX - (x + (size/2)), 2) + pow(mouseY - (y.get(i) + (size/2)), 2));
      if (dist <= size) {
        game_over = true;
      }
    }
    if (x < -size) {
      new_round();
    }
  }
}
