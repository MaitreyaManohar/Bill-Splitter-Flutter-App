
double avg(List<List> detailsnew){
  double sum=0;
  for (int i =0;i<detailsnew.length;i++){
    sum+=detailsnew[i][1];
  }
  return sum/detailsnew.length;

}

void reduce(List<List> detailsnew){
  double avgCost=avg(detailsnew);
  for (int i =0;i<detailsnew.length;i++){
    detailsnew[i][1]=avgCost-detailsnew[i][1];
  }
}

List<List> removeZero(List<List> detailsnew){
  List<List> finalList=[];
  for (int i =0;i<detailsnew.length;i++){
    if(detailsnew[i][1]<=-0.01 || detailsnew[i][1]>=0.01){
      finalList.add(detailsnew[i]);
    }
  }
  return finalList;
}

List<List> sort(List<List> array){
  int lengthOfArray = array.length;
  for (int i = 0; i < lengthOfArray - 1; i++) {
    for (int j = 0; j < lengthOfArray - i - 1; j++) {
      if (array[j][1] < array[j + 1][1]) {
        // Swapping using temporary variable
        List temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
  return (array);
}

String mainCalculator(List<List> details){
  List<List> detailsnew=[...details];
  reduce(detailsnew);
  detailsnew=sort(detailsnew);
  String str="";
  while(detailsnew.isNotEmpty){
    str+="${detailsnew[0][0]} pays ${detailsnew[0][1]} to ${detailsnew[detailsnew.length-1][0]}\n";
    detailsnew[detailsnew.length-1][1]+=detailsnew[0][1];
    detailsnew[0][1]=0;
    detailsnew=removeZero(detailsnew);
    detailsnew=sort(detailsnew);
  }
  return str;
}