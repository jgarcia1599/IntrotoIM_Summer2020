//National Data on the relative frequency of given names in the population of U.S. births where the individual has a Social Security Number
//(Tabulated based on Social Security records as of March 3, 2019)

// A word cloud visualization of the Most common names in the US in 2018
// By Junior Garcia

//2018 Baby Names in the U.S. word cloud
String names [];
int counts [];
PFont f;
int max_count = 0;
int min_count = 0;
void setup(){
  size(1000, 600);
  background(33, 33, 33);
  // The text from the file is loaded into an array. 
  String stuff[] = loadStrings("yob2018.csv");
  //check the size of the array
  print(stuff.length);
  //make the sizes of the names and the counts
  names = new String [stuff.length];
  counts = new int [stuff.length];
  // save the name and the count from the original dataset
  for (int i = 0 ; i< stuff.length;i++){
    String data []= split(stuff[i], ',' );
    names[i] = data[0];
    counts[i] = parseInt(data[2]);
  }
  // get the max count and the min count for normalization
  max_count = counts[0];
  min_count = counts[counts.length-1];



}
int counter =0;

//determines the size of the most popular name
int big_size = 80;
void draw(){
  //draw each name per frame using the draw loop
  if(counter!=names.length){
     //println("hiii");
     f = createFont("Monaco", big_size);
     //use a smaller, get difference-preserving size, for the font
     float normalized_size = normalizer(max_count,min_count,counts[counter],big_size);

     //Place the bigger names in the center
     if (normalized_size>(big_size/2)){
        textFont(f, normalized_size);
        fill(random(255),random(255),random(255),normalizer(names.length,0,counts[counter],255));
        text(names[counter], random(width/4,2*width/3), random(height/4,2*height/3));
        counter++;
     }else{
        //Place the smaller names everywhere else in the canvas
        textFont(f, normalized_size);
        fill(random(255),random(255),random(255),normalizer(names.length,0,counts[counter],255));
        text(names[counter], random(big_size,width-big_size), random(big_size,height-big_size));
        counter++;
     
     
     }

    
    
  }


}

//normalizer function that returns a smaller value for the size of the text font while perserviing the difference between the original values
float normalizer(float max, float min, float value, float desired_max){
  //Normalizes between 0 and 1
  float normalized_value = (value - min)/max;
  float result = normalized_value * desired_max;
  return result;
}
