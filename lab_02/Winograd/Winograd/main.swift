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
var matrixA = getMatrix(nA, mA)

var nB : Int = 0
var mB : Int = 0

getSizeMatrix(&nB, &mB)
var matrixB = getMatrix(nB, mB)


if checkSizes(nA, mA, nB, mB) {
    print("\nМатрица А")
    printMatrix(n: nA, m: mA, matrix: matrixA)
    print("\nМатрица В")
    printMatrix(n: nB, m: mB, matrix: matrixB)

    print("\nСтандарт")
    let matrixStandard = standardMultiplication(matrixA, matrixB)

    var time = benchmark(standardMultiplication, matrixA, matrixB)
    print("Время | ", time)
    printMatrix(n: nA, m: mB, matrix: matrixStandard)

    print("\nВиноград неоптимизированный")
    let matrixWinograd = Winograd(matrixA, matrixB)

    time = benchmark(Winograd, matrixA, matrixB)
    print("Время | ", time)
    printMatrix(n: nA, m: mB, matrix: matrixWinograd)

    print("\nВиноград оптимизированный")
    let matrixWinogradOptimal = WinogradOptimal(matrixA, matrixB)

    time = benchmark(WinogradOptimal, matrixA, matrixB)
    print("Время | ", time)
    printMatrix(n: nA, m: mB, matrix: matrixWinogradOptimal)
}
