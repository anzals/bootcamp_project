
class Ball
{
  PVector position;
  PVector velocity;
  color colour;
  float radius;
 


  Ball() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(random(-1, 1), random(-1, 1 ));
    colour = color(random(100, 120), random(200, 250), random(130, 160));
    radius= 20;
  }

  void draw() {
    noStroke();
    fill(colour);
    circle(position.x, position.y, radius*3);
  }

  void move() {
    position.x += velocity.x;
    position.y += velocity.y;

    if (position.x-radius < 0) {
      velocity.x *= -1;
    } else if (position.x+radius > width) {
      velocity.x *= -1;
    }
    if (position.y-radius < 0) {
      velocity.y *= -1;
    } else if (position.y+radius > height) {
      velocity.y *= -1;
    }
  }

  
  }
