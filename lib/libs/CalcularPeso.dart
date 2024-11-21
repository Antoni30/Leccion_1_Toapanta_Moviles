class Calcularpeso {
    
    double calcular(double pesoActual,double pesoAnterior, int numPersona){
      double pesoSum=0;
      if (numPersona <= 100){
          pesoSum=pesoActual+pesoAnterior;
      }
      return pesoSum;
    }
}