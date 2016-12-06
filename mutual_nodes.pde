/*  Simple dynamic bubbles graphics created with love in Processing
    Rupal Barman 2016
*/

Node node[]= new Node[20];

void setup()
{
  //size(700, 600);
  fullScreen();
  background(0);
  
  for(int i=0; i<20; i++)
    node[i]= new Node();
}

void draw()
{
  background(0);

  for(int i=0; i<20; i++)
  {
    node[i].run();
    node[i].boundary();
    node[i].show_scan_boundary();
    for(int j=0; j<20; j++){
      node[j].radar(node[i]);
    }
  }
    
}

void radar(Node n1, Node n2)
{
  //println(dist(n1.location.x, n1.location.y, n2.location.x, n2.location.y));
  if(dist(n1.location.x, n1.location.y, n2.location.x, n2.location.y)<n1.scan_radius)
  {
    pushMatrix();
    stroke(255);
    line(n1.location.x, n1.location.y, n2.location.x, n2.location.y);
    popMatrix();
  }
}
