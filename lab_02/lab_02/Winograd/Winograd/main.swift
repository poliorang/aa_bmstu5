//
//  main.swift
//  Vinograd
//
//  Created by poliorang on 16.10.2022.
//

import Foundation

var nA : Int = 0
var mA : Int = 0

getSizeMatrix(&nA, &mA)

print("\nСгенерировать матрицу? y/n")
var answer = readLine()

var matrixA : [[Int]] = []
if answer == "y" {
    matrixA = generateMatrix(nA, mA)
    print("Матрица сгенерирована\n")
} else if answer == "n" {
    matrixA = getMatrix(nA, mA)
}


var nB : Int = 0
var mB : Int = 0

getSizeMatrix(&nB, &mB)

print("\nСгенерировать матрицу? y/n")
answer = readLine()

var matrixB : [[Int]] = []
if answer == "y" {
    matrixB = generateMatrix(nB, mB)
    print("Матрица сгенерирована\n")
} else if answer == "n" {
    matrixB = getMatrix(nB, mB)
}

if checkSizes(nA, mA, nB, mB) {
    if nA <= 30 && mA <= 30 && nB <= 30 && mB <= 30 {
        print("\nМатрица А")
        printMatrix(n: nA, m: mA, matrix: matrixA)
        print("\nМатрица В")
        printMatrix(n: nB, m: mB, matrix: matrixB)
    }

    print("\nСтандарт")
    let matrixStandard = standardMultiplication(matrixA, matrixB)

    var time = benchmark(standardMultiplication, matrixA, matrixB)
    print("Время | ", time)
//    printMatrix(n: nA, m: mB, matrix: matrixStandard)

    print("\nВиноград неоптимизированный")
    let matrixWinograd = Winograd(matrixA, matrixB)

    time = benchmark(Winograd, matrixA, matrixB)
    print("Время | ", time)
//    printMatrix(n: nA, m: mB, matrix: matrixWinograd)

    print("\nВиноград оптимизированный")
    let matrixWinogradOptimal = WinogradOptimal(matrixA, matrixB)

    time = benchmark(WinogradOptimal, matrixA, matrixB)
    print("Время | ", time)
//    printMatrix(n: nA, m: mB, matrix: matrixWinogradOptimal)
}
