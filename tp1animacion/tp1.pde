
PImage[] quieto;
PImage[] caminar;
PImage[] saludar;
PImage[] estrella;
PImage titulo;

int estado = 0;
int frameActual = 0;

int tiempoAnterior = 0;
int velocidad = 200;

int xPersonaje = 40;
int yPersonaje = 350;


int frameEstrella = 0;
int tiempoEstrella = 0;
int velocidadEstrella = 150;
int tiempoInicio = 0;
int yTitulo = -150;
int velocidadTitulo = 5;

void setup() {

  size(800, 600);

  quieto = new PImage[1];
  caminar = new PImage[4];
  saludar = new PImage[1];
  estrella = new PImage[3];

 
  for (int i = 0; i < quieto.length; i++) {
    quieto[i] = loadImage("quieto" + i + ".png");
  }


  for (int i = 0; i < caminar.length; i++) {
    caminar[i] = loadImage("caminar" + i + ".png");
  }


  for (int i = 0; i < saludar.length; i++) {
    saludar[i] = loadImage("saludar" + i + ".png");
  }


  tiempoAnterior = millis();
  
  


for (int i = 0; i < estrella.length; i++) {
  estrella[i] = loadImage("estrella" + i + ".png");
}
    tiempoEstrella = millis();
    tiempoInicio = millis();

titulo = loadImage("titulo.png");

}



void draw() {

 background(150, 190, 238);



  fill(80, 180, 90);
  rect(0, 500, width, 100);



  if (estado == 0) {

    velocidad = obtenerVelocidad(estado);

    mostrarAnimacion(quieto, xPersonaje, yPersonaje, velocidad);

  } else if (estado == 1) {

    velocidad = obtenerVelocidad(estado);

    mostrarAnimacion(caminar, xPersonaje, yPersonaje, velocidad);

  } else if (estado == 2) {

    velocidad = obtenerVelocidad(estado);

    mostrarAnimacion(saludar, xPersonaje, yPersonaje, velocidad);
  }



  fill(0);
  textSize(20);

  text("1 = Quieto", 20, 30);
  text("2 = Caminar", 20, 55);
  text("3 = Saludar", 20, 80);
  text("R = Reiniciar", 20, 105);

if (millis() - tiempoInicio > 10000) {

  mostrarEstrella(estrella, 100, 100, velocidadEstrella);
  mostrarEstrella(estrella, 250, 150, velocidadEstrella);
  mostrarEstrella(estrella, 400, 80, velocidadEstrella);
  mostrarEstrella(estrella, 550, 180, velocidadEstrella);
  mostrarEstrella(estrella, 680, 100, velocidadEstrella);
}

if (millis() - tiempoInicio > 15000) {

  image(titulo, 250, yTitulo, 300, 150);

  if (yTitulo < 200) {
    yTitulo = yTitulo + velocidadTitulo;
  }

  if (yTitulo > 200) {
    yTitulo = 200;
  }
}



}



void mostrarAnimacion(PImage[] animacion, int x, int y, int vel) {

  image(animacion[frameActual], x, y,128, 152);

  
  if (millis() - tiempoAnterior > vel) {

    frameActual = frameActual + 1;
    tiempoAnterior = millis();

   
    if (frameActual >= animacion.length) {
      frameActual = 0;
    }
  }
}


void cambiarEstado(int nuevoEstado, int nuevoFrame) {

  estado = nuevoEstado;
  frameActual = nuevoFrame;
  tiempoAnterior = millis();
}



int obtenerVelocidad(int estadoActual) {

  if (estadoActual == 0) {
    return 300;
  } else if (estadoActual == 1) {
    return 120;
  } else {
    return 180;
  }
}


void reiniciar() {

  estado = 0;
  frameActual = 0;
  velocidad = 200;
  tiempoAnterior = millis();
  xPersonaje = 40;
  yPersonaje = 350;

}



void keyPressed() {

  if (key == '1') {

    cambiarEstado(0, 0);

  } else if (key == '2') {

    cambiarEstado(1, 0);
    xPersonaje = xPersonaje + 40;

  } else if (key == '3') {

    cambiarEstado(2, 0);
    xPersonaje = xPersonaje + 40;
    
  } else if (key == 'r' || key == 'R') {

    reiniciar();
  }
   
}


void mostrarEstrella(PImage[] animacion, int x, int y, int vel) {

  image(animacion[frameEstrella], x, y, 80, 80);

  if (millis() - tiempoEstrella > vel) {

    frameEstrella = frameEstrella + 1;
    tiempoEstrella = millis();

    if (frameEstrella >= animacion.length) {
      frameEstrella = 0;
    }
  }
}
