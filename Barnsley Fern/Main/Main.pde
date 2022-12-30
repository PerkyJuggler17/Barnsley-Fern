float x = 0;
float y = 0;

float a = 0.85;
float b = 0.04;
float c = 0;
float d = 1.6;

void setup()
{
  size(600, 600);
  //fullScreen();
  background(255);
}

void nextPoint()
{
  float nextX;
  float nextY;

  float r = random(1);

  if (r < 0.01)
  {
    // 1
    nextX = 0;
    nextY = 0.16 * y;
  } else if (r < 0.86)
  {
    // 2
    nextX = a * x + b * y + c;
    nextY = -b * x + a * y + d;
  } else if (r < 0.93)
  {
    // 3
    nextX = 0.2 * x + -0.26 * y + c;
    nextY = 0.23 * x + 0.22 * y + d;
  } else
  {
    // 4
    nextX = -0.15 * x + 0.28 * y + c;
    nextY = 0.26 * x + 0.24 * y + 0.44;
  }

  x = nextX;
  y = nextY;
}

// right mapping ----- -2.1820 < x < 2.6558 and 0 < y < 9.9983

void drawPoint()
{
  float px = map(x, -4, 4, 0, width);
  float py = map(y, 0, 10.2, height, 0);

  stroke(0);
  strokeWeight(0.3);

  point(px, py);
  println(px, py);
}

void draw()
{
  for (int i = 0; i < 1000; i++)
  {
    drawPoint();
    nextPoint();
  }
}
