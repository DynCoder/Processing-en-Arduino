import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(4, 79, 111);
color on = color(84, 145, 158);

float buttonX;
float buttonY;
float buttonW;
float buttonH;

Minim minim;
AudioPlayer player;
ArrayList<Songs> s;
int k;

String filename;

boolean isSelected = false;

void setup() {
  
  println(Arduino.list());
  
  arduino = new Arduino(this, "COM10", 57600); //POORT

  for (int z = 2; z <= 13; ++z)
    arduino.pinMode(z, Arduino.OUTPUT);
  

  s = new ArrayList();

  textSize(24);

  frame.setResizable(false);

  background(255);

  size(600, 600);

  fill(0);
  stroke(0);
  noFill();

  buttonW = 200;
  buttonH = 50;
  buttonX = width - width/2 - buttonW/2;
  buttonY = height/2 - buttonH/2;

  // Minim stuff
  minim = new Minim(this);
  
}

void draw() {
  
  background(255);
  fill(0);

  rectMode(CORNER);

  rect(buttonX, buttonY, buttonW, buttonH);

  fill(255);

  textAlign(LEFT);
  text("Import File", buttonX+35, buttonY+30);

  if (isSelected) {
    s.get(k).waveform();
  }
}

void mouseClicked() {
  if (mouseX>buttonX && mouseX < buttonX+buttonW && mouseY > buttonY && mouseY < buttonY+buttonH) {
    selectInput("Import music file", "fileSelected");
    
  }
}

/* Taken from Processing.org */
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or user hit cancel");
  } 
  else {
    filename = selection.getAbsolutePath();
    s.add(new Songs(player, filename, "Filename"));
    isSelected = true;
  }
}

// stop minim and the player.
void stop() {
  player.close();
  minim.stop();
  super.stop();
}

class Songs {
  AudioPlayer song; 
  String directory;
  String songName;
  Songs(AudioPlayer song, String directory, String songName) {

    song=minim.loadFile(directory);    

    this.song=song;
    this.songName=songName;
    song.play();
  }



  void waveform() {
    for (int j = 1; j < song.bufferSize() - 1; j++)
    {
      if (j>0) {
        
        float val = (float)Math.round(map(50 + song.left.get(j) * 5000, -1500, 6500, 1, 8)); //Aantal LEDs
        
        for (int on = 2; on <= val; ++on) //Min aantal LEDs
          arduino.digitalWrite(on, Arduino.HIGH);
    
        for (int off = 8; off > val; --off) //Max aantal LEDs
          arduino.digitalWrite(off, Arduino.LOW);
          
        println(50 + song.left.get(j) * 500);
        println(val);
        println("-----");
      }
    }
  }
}