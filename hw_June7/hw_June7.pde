//National Data on the relative frequency of given names in the population of U.S. births where the individual has a Social Security Number
//(Tabulated based on Social Security records as of March 3, 2019)

//2018 Baby Names in the U.S. word cloud
String names [];
int counts [];
PFont f;
int max_count = 0;
int min_count = 0;
void setup(){
    size(800, 800);
  // The text from the file is loaded into an array. 
  String stuff[] = loadStrings("yob2018.csv");
  // This array has one element because the file only has one line. 
  print(stuff.length);
  names = new String [stuff.length];
  counts = new int [stuff.length];
  for (int i = 0 ; i< stuff.length;i++){
    String data []= split(stuff[i], ',' );
    names[i] = data[0];
    counts[i] = parseInt(data[2]);
  }

    //for (int i = 0 ; i< names.length;i++){
    //   f = createFont("Monaco", 32);
    //   textFont(f, counts[i]);
    //   text(names[i], random(width), random(height));
    //   fill(random(255),random(255),random(255));
    //}
  max_count = counts[0];
  min_count = counts[counts.length-1];
  println(normalizer((float) max_count,(float) min_count,(float) 10000,(float)32));



}
int counter =0;
void draw(){
  if(counter!=names.length){
     //println("hiii");
     f = createFont("Monaco", 32);
     float normalized_size = normalizer(max_count,min_count,counts[counter],32);
     println(normalized_size);
     textFont(f, normalized_size);
     text(names[counter], random(width), random(height));
     fill(random(255),random(255),random(255));
     counter++;
    
    
  }


}

float normalizer(float max, float min, float value, float desired_max){
  //Normalizes between 0 and 1
  float normalized_value = (value - min)/max;
  float result = normalized_value * desired_max;
  return result;
}