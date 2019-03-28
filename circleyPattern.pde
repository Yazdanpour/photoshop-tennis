
int  circNum, sivId;
float blockSize;
boolean isColorMode = true;
int bgClr = 250;
color[] colors = { color(240,207,97),  color(98,191,73), color(255,139,139),color(183,227,228),color(50,182,122),color(238,217,116) };
//color[] colors = {color("#152A3B"), color("#158ca7"), color("#F5C03E"), color("#D63826", "#0F4155", "#7ec873", "#4B3331"}
void setup() {
  size(800, 800);
  background(0);
 noLoop();
  strokeWeight(2);
  //strokeCap(SQUARE);
  stroke(0, 200);
  //noStroke();
  //sivId = setInterval(function () { genParcattern(); }, 3000);
    genParcattern();
    save("PAT.PNG");
}

void draw(){
//  genParcattern();
}



void genParcattern() {
  circNum = 4;
  blockSize = 70;
print( -blockSize/2+blockSize);
  if (isColorMode) { bgClr = colors[colors.length - 1]; } else { bgClr = 250; }
  fill(bgClr); rect(0, 0, width, height);

  for(float y = blockSize/2; y < height+blockSize/2 ; y+= blockSize){
    for(float x = blockSize/2; x < width+blockSize/2 ; x+= blockSize){
      pushMatrix();
      translate(x, y);
      rotate(HALF_PI * int(random(0,4)));

      for(int i = circNum; i > 0; i--){
        float diam = (float)blockSize * 2 * i / (circNum + 1);
        if(i < 2 || !isColorMode){fill(bgClr);} else{ fill(colors[separateIdx(i - 1, circNum + 1)]); }
        arc(-blockSize/2, -blockSize/2, diam, diam, 0, HALF_PI );
      }

      for(int i = circNum; i > 0; i--){
        float diam = (float)blockSize * 2 * i / (circNum + 1);
        if(i < 2 || !isColorMode){ fill(bgClr); } else { fill(colors[separateIdx(i - 1, circNum + 1)]); }
        arc(-blockSize/2+blockSize, -blockSize/2+blockSize, diam, diam, PI, PI + HALF_PI);
      }
      popMatrix();
    }
  }
  colors = shuffleArray(colors);
}

void keyPressed() {
  switch(key) {
    case 'g': genParcattern(); break;
    case 'b': isColorMode = !isColorMode; genParcattern(); break;
    case 's': save("parcattern-" + random(100, 900)+ ".png"); break;
  }
}

int separateIdx(int idx, int Clength){
  return floor(Math.abs(idx - (Clength - 1) / 2 ));
}

color[] shuffleArray(color[] array) {
  int j, temp;
  for (int i = array.length - 1; i > 0; i--) {
    j = floor(random(1) * (i + 1));
    temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }

  return array;
}
