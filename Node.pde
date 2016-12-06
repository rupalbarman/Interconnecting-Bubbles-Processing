class Node
{
  PVector location;
  PVector speed;
  float scan_radius=100;
  
  Node()
  {
    location= new PVector(random(width),random( height));
    speed= new PVector(1.5, 1.5);
  }
  
  void run()
  {
    location.add(speed);
    pushMatrix();
    fill(255, 255, 0);
    ellipse(location.x, location.y, 20,20);
    popMatrix();
  }
  
  void boundary()
  {
    if(location.x>width || location.x<=0)
      speed.x*=random(-1, -2);
    if(location.y>height || location.y<=0)
      speed.y*=random(-1, -2);
  }
  
  void radar(Node otherNode)
  {
    //println(dist(n1.location.x, n1.location.y, otherNode.location.x, otherNode.location.y));
    if(dist(location.x, location.y, otherNode.location.x, otherNode.location.y)<scan_radius)
    {
      pushMatrix();
      stroke(random(255), random(255), random(255));
      strokeWeight(4);
      line(location.x, location.y, otherNode.location.x, otherNode.location.y);
      popMatrix();
    }
  }
  
  void show_scan_boundary()
  {
    pushMatrix();
    noFill();
    stroke(255,255,255);
    strokeWeight(2);
    ellipse(location.x, location.y, scan_radius, scan_radius);
    popMatrix();
  }
}