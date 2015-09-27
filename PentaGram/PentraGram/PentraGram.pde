import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
ArrayList<Module> mods = new ArrayList<Module>();
//Module[] mods = new Module[100];
int totalMods = 0;
void setup() {
//  size(400,400);
  size(1400, 1400);
  frameRate(10);
  noStroke();
  oscP5 = new OscP5(this,6666);
  myRemoteLocation = new NetAddress("127.0.0.1",6666);
//  mods[0] = new Module(50,50);
//  totalMods++;
}


void draw() {
  background(0);
  for (int i = 0; i < mods.size(); i++) {
    mods.get(i).update();
    mods.get(i).draw();
  }  
}


void remove(int id){
  for (int i = 0; i < mods.size(); i++) {
    if(mods.get(i).id == id){
      mods.remove(i);
    }
  }  
}

void add(int id, int x,int y){
  mods.add(new Module(id,x,y));
}

void updateMod(int id,int x,int y){
  for (int i = 0; i < mods.size(); i++) {
    if(mods.get(i).id == id){
      Module mod = mods.get(i);
      mod.x = x;
      mod.y = y;
    }
  }
}

void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/penta/add")==true) {
      add(theOscMessage.get(0).intValue(),theOscMessage.get(1).intValue(),theOscMessage.get(2).intValue());
  }else if(theOscMessage.checkAddrPattern("/penta/remove")==true){
      remove(theOscMessage.get(0).intValue());
  }
  else if(theOscMessage.checkAddrPattern("/penta/update")==true){
      updateMod(theOscMessage.get(0).intValue(),theOscMessage.get(1).intValue(),theOscMessage.get(2).intValue());
  }
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage);
}
