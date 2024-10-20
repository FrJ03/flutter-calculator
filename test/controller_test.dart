import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:flutter_calculator/controller.dart';

void main() {
  group('calculate tests', (){
    test('add two values', (){
      expect(Calculator().calculate('2+2'), 4.0);
    });
    test('add two values when the first is negative', (){
      expect(Calculator().calculate('-2+2'), 0.0);
    });
    test('add three values', (){
      expect(Calculator().calculate('2+1+1'), 4.0);
    });
    test('subtract three values', (){
      expect(Calculator().calculate('2-1-1'), 0.0);
    });
    test('add with real values', (){
      expect(Calculator().calculate('2+1.1'), 3.1);
    });
    test('product of two number', (){
      expect(Calculator().calculate('2*2',), 4.0);
    });
    test('product of three number', (){
      expect(Calculator().calculate('2*2*3',), 12.0);
    });
    test('product with real values', (){
      expect(Calculator().calculate('2*1.1'), 2.2);
    });
    test('Division of two number', (){
      expect(Calculator().calculate('2/2',), 1.0);
    });
    test('division with real values', (){
      expect(Calculator().calculate('2.2/1.1'), 2);
    });
    test('product and division', (){
      expect(Calculator().calculate('2*2/2',), 2.0);
    });
    test('product with an add at the beginning', (){
      expect(Calculator().calculate('2+2*2',), 6.0);
    });
    test('product with an add at the end', (){
      expect(Calculator().calculate('2*2+2',), 6.0);
    });
    test('product with an add in a parenthesis', (){
      expect(Calculator().calculate('(2+2)*2',), 8.0);
    });
    test('division with an add in a parenthesis', (){
      expect(Calculator().calculate('8/(1+3)',), 2.0);
    });
    test('division with an add in two parenthesis', (){
      expect(Calculator().calculate('8/(1+(1+1+1))',), 2.0);
    });
    test('division with a negative divisor', (){
      expect(Calculator().calculate('8/(-4)',), -2.0);
    });
    test('division with a negative divisor', (){
      expect(Calculator().calculate('8/(4-8)',), -2.0);
    });
    test('add with a negative number at the end', (){
      expect(Calculator().calculate('8+(-4)',), 4.0);
    });
    test('add with a negative number at the beginning', (){
      expect(Calculator().calculate('(-4)+8',), 4.0);
    });
  });
}