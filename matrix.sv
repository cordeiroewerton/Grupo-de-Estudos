module matrix_exemplo;
  //Declarando array 
  int array[2:0][3:0];
  
  initial begin
    //Definindo valores do array
    array = '{'{0,1,2,3},'{4,5,6,7},'{8,9,10,11}};
 
    //Imprimindo valores do array 
    $display("-------Valores do array-------");
    foreach(array[i,j]) $display("\t array[%0d][%0d] = %0d",i,j,array[i][j]);
  end
endmodule
