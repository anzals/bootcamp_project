Ball[] balls;
Ball specialBall;
int screenSizeX, screenSizeY, stage;
PFont title;
color infectedColour;
int seconds;


void setup() {
  size(500, 500);
  title = createFont("Arial", 100, true);
  stage = 1;
  seconds = 0;

  balls = new Ball[50];
  for (int i=0; i < balls.length; i+=1)
  {
    balls[i] = new Ball();
    balls[i].colour = color(random(200, 250), random(200, 250), random(200, 250));
    balls[i].radius = random(4, 10);
  }
  infectedColour = color(34, 139, 34);
  specialBall = new Ball();
    specialBall.radius = 30;
    specialBall.colour = infectedColour;
    specialBall.position.x = 100;
    specialBall.position.y = 100;
    specialBall.velocity.x = 0;
    specialBall.velocity.y = 0;
}

void draw() {
  if (stage == 1) {
    textAlign(CENTER);
    textSize(60);
    fill(0, 128, 0);
    text("CATCH", 250, 250);
    textSize(16);
    text("Press any key to start...", 250, 270);
    if (keyPressed == true) {
      stage = 2;
    }
  }

  if (stage == 2) {
    
    
    //seconds = int(frameCount/frameRate);


    
 
    background(200);
    for (Ball ball : balls) {
      ball.draw();
      ball.move();
      timer();

      if (dist(specialBall.position.x, specialBall.position.y, ball.position.x, ball.position.y) < specialBall.radius+ball.radius) {
        ball.colour = infectedColour;
      }
      
    }



    specialBall.draw();
    
    if (dist(specialBall.position.x, specialBall.position.y, width, height) < 0 ) {
      specialBall.position.y = height;
      specialBall.position.x = width;
    }
    
    boolean allInfected = true;
    for (Ball ball : balls) {
      if (!(ball.colour == infectedColour)) {
        allInfected = false;
      }
    }

    if (allInfected) {
      textSize(50);
      textAlign(CENTER);
      fill(255);
      text("LEVEL COMPLETE", width/2, height/2);
      noLoop();
    }
  }
}

void keyPressed() {
  println(key);
  if (key == 'w') {
    specialBall.position.y -= 10;
    if (specialBall.position.y + specialBall.radius < 0) {
      specialBall.position.y = height;
    }
  }
  if (key == 's') {
    specialBall.position.y += 10;
    if (specialBall.position.y - specialBall.radius > height) {
      specialBall.position.y = 0;
    }
  }
  if (key == 'a') {
    specialBall.position.x -= 10;
    if (specialBall.position.x + specialBall.radius < 0) {
      specialBall.position.x = width;
    }
  }
  if (key == 'd') {
    specialBall.position.x += 10;
    if (specialBall.position.x + specialBall.radius > width) {
      specialBall.position.x = 0;
    }
  }
}

void timer() {

  textSize(25);

  seconds = frameCount/60;
  if (seconds >= 30) {
    textSize(60);
    textAlign(CENTER);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2);
    noLoop();
  }

  fill(255);

  textSize(25);
  text(seconds, width-110, height-475);
  text("seconds", width-55, height-475);
}
