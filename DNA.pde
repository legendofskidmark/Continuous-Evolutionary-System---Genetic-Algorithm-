

class DNA{
//                speed, fin, tail fin, teeth, eye size, gender, size, eye_taste, tail_taste
  int gene_length = 9;
  
  float[] gene;
  
  DNA(){
    gene = new float[gene_length];
    
    for(int i = 0 ; i < gene_length ; i++){
      gene[i] = random(0,1);
    }
    
    // 51% chance of being male or female
    if(random(1) <= 0.51){
      gene[5] = 1;
    }
    else{
      gene[5] = 0;
  }
 }

  DNA(float[] newgenes){
    gene = newgenes;
  }
  
  
  DNA copy(){
    float newgenes[] = new float[gene_length];
    
    for(int i = 0 ; i < gene_length ; i++){
      newgenes[i] = gene[i];
    } 
    
    return new DNA(newgenes);
  }
  
  void mutate(float m){
    
    for(int i = 0; i < gene_length ; i++){
      if(random(1) < m){
        gene[i] = random(0,1);
      }
    }
    
    if(gene[5] >= 0.49){
        gene[5] = 1;
      }
     else{
     gene[5] = 0;
     }
  
  }


}
