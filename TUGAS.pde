import java.util.ArrayList;
import processing.sound.*;

ArrayList<Cokroach> coks;
PImage img;
SoundFile soundFX;
int lastSpawnTime = 0;
int score = 0;

void setup() {
  size(800, 800);
  coks = new ArrayList<Cokroach>();
  img = loadImage("kecoa.png");
  soundFX = new SoundFile(this, "Jump.wav");  
}

void draw() {
  background(255);

  if (millis() - lastSpawnTime > 5000) {
    float x = random(width);
    float y = random(height);
    coks.add(new Cokroach(img, x, y));
    lastSpawnTime = millis();
  }

  for (int i = coks.size() - 1; i >= 0; i--) {
    Cokroach c = coks.get(i);
    c.live();
  }
  
  fill(51);
  textSize(16);
  text("nums: " + coks.size(), 50, 750);
  text("KECOA MATI : " + score, 50, 770);
  text("NAMA : LUTHFAN AUZAN PRADANA", 10,20 );
  text("NIM     : 22.11.5248", 10,40 );
  
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    for (int i = coks.size() - 1; i >= 0; i--) {
      Cokroach c = coks.get(i);
      if (dist(mouseX, mouseY, c.pos.x, c.pos.y) < img.width / 2) {
        coks.remove(i);  
        soundFX.play();
        score++;
        break;
      }
    }
  }
}
