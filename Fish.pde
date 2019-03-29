

class Fish{

   PVector position;
   PVector velocity;
   DNA dna;
   float health;
   float xoff,yoff;
   float r;
   float maxspeed;
   float age;
   PImage[] images;
   int dim_x[] = new int[8];
   int dim_y[] = new int[8];
   int index;
   
   Fish(PVector l, DNA dna_){
     position = l.get();
     
     health = 100; //change later
     xoff = random(1000);
     yoff = random(1000);
     dna = dna_;
     age = millis();
     images = new PImage[16];
     
     dim_x[0] = 200;  dim_y[0] = 110;
     dim_x[1] = 110;  dim_y[1] = 70;
     dim_x[2] = 90;  dim_y[2] = 80;
     dim_x[3] = 100;  dim_y[3] = 80;
     dim_x[4] = 100;  dim_y[4] = 80;
     dim_x[5] = 100;  dim_y[5] = 80;
     dim_x[6] = 80;  dim_y[6] = 60;
     dim_x[7] = 80;  dim_y[7] = 25;
     
     images[0] = loadImage("angle1-min.png");
     images[9] = loadImage("beaut1-min.png");
     images[2] = loadImage("betta1-min.png");
     images[3] = loadImage("blue1-min.png");
     images[12] = loadImage("gold1-min.png");
     images[5] = loadImage("gold2-min.png");
     images[6] = loadImage("gold3-min.png");
     images[7] = loadImage("wrasse-min.png");
     
     images[8] = loadImage("angle1x-min.png");
     images[1] = loadImage("beaut1x-min.png");
     images[10] = loadImage("betta1x-min.png");
     images[11] = loadImage("blue1x-min.png");
     images[4] = loadImage("gold1x-min.png");
     images[13] = loadImage("gold2x-min.png");
     images[14] = loadImage("gold3x-min.png");
     images[15] = loadImage("wrassex-min.png");
     
     maxspeed = map(dna.gene[0],0 , 1, 5, 0); //speed !!! look once
     r = map(dna.gene[6], 0, 1, 0, 50); // size of fish
   }
  
  
  void run()  {
      update();
      borders();
      display();
  }
 
 
 void update(){
   
   float vx = map(noise(xoff),0,1,-maxspeed,maxspeed);
   float vy = map(noise(yoff),0,1,-maxspeed,maxspeed);
   velocity = new PVector(vx,vy);
   
   xoff += 0.00001;
   yoff += 0.00001;
   
   position.add(velocity);
   
 }
  
  
    void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) {position.x = -r;}
    if (position.y > height+r) {position.y = -r;}
    
 
  }
  
  void display(){
    
    index = display_helper(dna);
      
      if(velocity.x <= 0){
    image(images[index], position.x, position.y, dim_x[index], dim_y[index]);
    }
    else{
    image(images[index+8], position.x, position.y, dim_x[index], dim_y[index]);
  }
  
  }
  
  int display_helper(DNA dnax){
        if((dnax.gene[1] >= 0.4 && dnax.gene[2] >= 0.4) && dnax.gene[4] >= 0.4) {
          return 1;
        }
        
        else if(dnax.gene[1] >= 0.6 && dnax.gene[2] >= 0.6){
          return 2; }
        else if(dnax.gene[2] >= 0.68967){
          if(dnax.gene[6] <= 0.6987)return 4;
          return 6;  
                }
         else if(dnax.gene[4] >= 0.4679){
        return 3;}
        if(dnax.gene[3] <= 0.3){
           return 7;     
        }
        return 5;
        
  }
  
  void eat(ArrayList<Food> f){
    
    for(int i = 0 ; i < f.size() ; i++){
      float x = f.get(i).Xdim;
      float y = f.get(i).Ydim;
      PVector foodPosition = new PVector(x,y);
      float d = PVector.dist(position, foodPosition);
      
      if(d <= r/1.5){
        health += 10; //5
        //dim_x[index] += 10;
        //dim_y[index] += 10;
        //this.images[index].resize(dim_x[i],dim_y[i]);
        
        // to increase its size upon eating
        r += 0.2;
        f.remove(i);
      }
      
    } 
  
  }
  
  Fish reproduce(Fish partner){
    
    float d = PVector.dist(partner.position, position);
    
    boolean liking = (abs(partner.dna.gene[7] - dna.gene[7]) <= 0.01) || (abs(partner.dna.gene[8] - dna.gene[8]) <= 0.01);
    
    //println((partner.dna.gene[5]) + " " + (dna.gene[5]));
    
    
    if( (     ((partner.dna.gene[5] == 1) && (dna.gene[5] == 0))
            || 
              ((partner.dna.gene[5] == 0) && (dna.gene[5] == 1))
       
       )
       //)am
       
       && d <= r/2 && ((millis() - partner.age) >= 120000) && ((millis() - age) >= 120000) && liking && (random(1) <= 0.5))
       
       {
           
           DNA childDNA = new DNA();
           
           // 50% chance to get genes from either of parent
           for(int i = 0 ; i < dna.gene_length ; i++){
               if(random(1) <= 0.5){
                 childDNA.gene[i] = partner.dna.gene[i];
               }
                else{
                  childDNA.gene[i] = dna.gene[i];
                }           
           }
           
           
          if(partner.dna.gene[5] == 1){
            partner.health -= 10;
            health -= 15;  
        }
        
        else{
          partner.health -= 15;
            health -= 10;
        }
                    
         if(random(1) >= 0.3){
           childDNA.mutate(0.001);
          }
          
         println("child born");
         return new Fish(position, childDNA);
       }
       else{
       return null;
      }
  }
  
  
  boolean dead(){
      
    if(health <= 0.0){
      println("Dead bro");
      return true;
    }
    return false;
  }
  
  
}
