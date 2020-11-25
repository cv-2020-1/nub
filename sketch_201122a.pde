import nub.primitives.*;
import nub.core.*;
import nub.processing.*;

Scene scene;
Node n0, n1, n2, n3, n4, n5, n6, n7, n8;
Node ellipse, sphere, box;

PShader myShader;

void setup() {
  size(1080, 720, P3D);

  scene = new Scene(this);
  scene.enableHint(Scene.BACKGROUND, color(0));
  scene.togglePerspective();
  scene.fit();  
  
  ellipse = new Node(createShape(ELLIPSE, 0, 0, 10, 20));
  box = new Node(createShape(BOX, 6));
  sphere = new Node(createShape(SPHERE, 9));
  
  n0 = new Node(createShape(BOX, 6));
  n1 = new Node(n0, createShape(BOX, 15));
  n2 = new Node(n0, createShape(BOX, 15));
  n3 = new Node(n0, createShape(BOX, 15));
  n4 = new Node(n0, createShape(BOX, 15));
  n5 = new Node(n0, createShape(BOX, 15));
  n6 = new Node(n0, createShape(BOX, 15));
  n7 = new Node(n0, createShape(BOX, 15));
  n8 = new Node(n0, createShape(BOX, 15));
  
  ellipse.translate(20, 0, -30);
  box.translate(0, 0, -30);
  sphere.translate(-20, 0, -30);
  
  n1.translate(80, -70, 5);
  n2.translate(-80, -70, 5);
  n3.translate(-50, 50, 50);
  n4.translate(80, 80, 50);
  n5.translate(65, 10, 50);
  n6.translate(10, 65, 50);
  n7.translate(-65, -10, 50);
  n8.translate(-10, -65, 50);
  
  myShader = loadShader("fragmentshader.glsl", "vertexshader.glsl");
  shader(myShader);   
}


void draw() {  
  Scene.setUniform(myShader, "lightPos", n1.position()); 
  Scene.setUniform(myShader, "viewPos", n0.position());
  Scene.setUniform(myShader, "lightPosB", n2.position());   
  Scene.setUniform(myShader, "lightPosC", n3.position());   
  Scene.setUniform(myShader, "lightPosD", n4.position());   
  Scene.setUniform(myShader, "lightPosE", n5.position());   
  Scene.setUniform(myShader, "lightPosF", n6.position());   
  Scene.setUniform(myShader, "lightPosG", n7.position()); 
  Scene.setUniform(myShader, "lightPosH", n8.position()); 
  
  Scene.setUniform(myShader, "lightColor", new Vector(0.4, 0.2, 0.05) );
  Scene.setUniform(myShader, "objectColor", new Vector(0.8, 0.3, 0.1) );
  Scene.setUniform(myShader, "shiny", new Vector(8.0, 8.0, 8.0) );
  
  scene.render();
  
}

void mouseClicked() {
  scene.focusEye();
}

void mouseMoved() {
  scene.mouseTag();
}

void mouseDragged() {
  if (!scene.mouseTranslateTag()) {
    if (mouseButton == LEFT)
      scene.mouseSpinEye();
    else if (mouseButton == RIGHT)
      scene.mouseTranslateEye();
    else
      scene.scaleEye(mouseX - pmouseX);
  }
}
