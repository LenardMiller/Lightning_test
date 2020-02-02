PVector pointA;
PVector pointB;
PVector[] points;
int timer;
int variation;
int maxPoints;
boolean debug;
float alpha;

void settings() {size(600,600);}  

void setup() {
  pointA = new PVector(300, 300);
  pointB = new PVector(400,400);
  getPoints();
  timer = 50;
  variation = 50;
  maxPoints = 10;
  alpha = 255;
}  

void draw() {
  noStroke();
  fill(20,25,45);  
  rect(0,0,width,height);
  fill(140,140,160);
  fill(255);
  displayText();
 
  alpha -= 255/timer;
  if (frameCount % timer == 0) {
    pointB = new PVector(mouseX,mouseY);
    getPoints();
    alpha = 255;
  }
  stroke(255,alpha);
  line(pointB.x,pointB.y,points[points.length-1].x,points[points.length-1].y);
  int r = 255;
  if (debug) ellipse(points[1].x,points[1].y,5,5);
  for (int i = points.length-1; i > 1; i--) {
    r-=50;
    //stroke(r,r,r);
    line(points[i].x,points[i].y,points[i-1].x,points[i-1].y); 
    if (debug) ellipse(points[i].x,points[i].y,5,5);
    //text(i,points[i].x,points[i].y);
  }  
  line(points[1].x,points[1].y,pointA.x,pointA.y);
}  

void getPoints() {
    points = new PVector[(int)random(3,maxPoints)];
    if (debug) points = new PVector[6];
    float lineLength = sqrt(sq(pointB.x-pointA.x)+sq(pointB.y-pointA.y));
    float d = lineLength / points.length+1;
    for (int i = 1; i < points.length; i++) {
        float di = d*(i);
        PVector e = new PVector(pointA.x-pointB.x,pointA.y-pointB.y);
        e.setMag(di);
        e.x *= -1;
        e.y *= -1;
        points[i] = new PVector(e.x+300+random(-variation,variation),e.y+300+random(-variation,variation));
    }  
}

void displayText() {
  text("duration: " + timer, 10,20);  
  text("maxPoints: " + maxPoints, 10,40);  
  text("variation: " + variation, 10,60);  
}  
