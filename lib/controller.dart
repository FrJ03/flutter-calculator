class Calculator{
  //Method that receive an string with the operation and returns the operation result
  //An input example could be: 5+2*3
  double calculate(String operation){
    String operationSolved = solveParenthesis(operation);
    operationSolved = solveProductDivision(operationSolved);
    return solveAddSubtract(operationSolved);
  }

  double getFirstNumberValue(String operation){
    String a = '';
    for (int i = 0 ; i < operation.length ; i++){
      if (['+', '-'].contains(operation[i])){
        break;
      }
      else{
        a += operation[i];
      }
    }
    return double.parse(a);
  }

  double solveAddSubtract(String operation){
    //getting the first number
    double result = 0.0;
    if(operation[0] == '-'){
      result = 0-getFirstNumberValue(operation.substring(1));
      for(int i = 1 ; i < operation.length ; i++){
        if(['+', '-'].contains(operation[i])){
          double b = getFirstNumberValue(operation.substring(i + 1, operation.length));
          switch(operation[i]){
            case '+':
              result += b;
            case '-':
              result -= b;
          }
        }
      }
    }
    else{
      result = getFirstNumberValue(operation);
      for(int i = 0 ; i < operation.length ; i++){
        if(['+', '-'].contains(operation[i])){
          double b = getFirstNumberValue(operation.substring(i + 1, operation.length));
          switch(operation[i]){
            case '+':
              result += b;
            case '-':
              result -= b;
          }
        }
      }
    }
    return result;
  }

  String solveProductDivision(String operation){
    String operationCopy = '';
    String a = '';
    for(int i = 0 ; i < operation.length ; i++){
      if (['*', '/'].contains(operation[i])){
        String b = '';

        int newI = 0;
        for (int j = i+1 ; j <= operation.length ; j++){
          if (j >= operation.length || ['+', '-', '*', '/'].contains(operation[j])){
            newI = j-1;
            break;
          }
          else{
            b += operation[j];
          }
        }

        String result = '';
        switch(operation[i]){
          case '*':
            result += (double.parse(a) * double.parse(b)).toString();
          case '/':
            result += (double.parse(a) / double.parse(b)).toString();
        }
        a=result;
        i = newI;
      }
      else if(['+', '-'].contains(operation[i])){
        operationCopy += a + operation[i];
        a = '';
      }
      else{
        a += operation[i];
      }
    }
    operationCopy += a;
    return operationCopy;
  }

  String solveParenthesis(String operation){
    String operationSolved = '';
    bool hasParenthesis = false;
    for (int i = 0 ; i < operation.length ; i++){
      if(operation[i] == '('){
        hasParenthesis = true;
        int nOps = 0;
        int nParenthesis = 1;
        for(int j = i + 1; j < operation.length && nParenthesis != 0 ; j++){
          if(['+', '-', '*', '/'].contains(operation[j])){
            nOps++;
          }
          else if(operation[j] == ')'){
            nParenthesis--;

            if(nParenthesis == 0 && (nOps != 1 || operation[i+1] != '-')){
              operationSolved += calculate(operation.substring(i+1, j)).toString();
              i = j;
              break;
            }
          }
          else if(operation[j] == '('){
            nParenthesis++;
          }
        }
      }
      else{
        operationSolved += operation[i];
      }
    }
    if(!hasParenthesis){
      operationSolved = operation;
    }

    return operationSolved;
  }
}