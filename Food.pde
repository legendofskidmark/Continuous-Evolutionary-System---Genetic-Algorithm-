
class Food{

  float Xdim,Ydim;
  float gravity = 0.001;
  float speed = 0;
  
  Food(float x,float y){
    this.Xdim = x;
    this.Ydim = y;
  }
  
  void run(){
   fill(178,34,34);
   circle(this.Xdim,this.Ydim,10);
   this.Ydim += speed;
   
   speed += (gravity);
   
   if(this.Ydim > height){
     speed *= -0.95; // think abt speed
     this.Ydim = height;
   }
   
  }
  

}
