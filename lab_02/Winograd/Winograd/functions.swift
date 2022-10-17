//
//  functions.swift
//  lab01
//
//  Created by poliorang on 15.10.2022.
//

import Foundation

func createMatrix(n: Int, m: Int, fill: Int) -> Array<[Int]> {
    let matrix = [[Int]](repeating: [Int](repeating: fill, count: m), count: n)
    
    return matrix
}

func printMatrix(n: Int, m : Int, matrix: [[Int]]) {
    for i in 0..<n {
        for j in 0..<m {
            print(matrix[i][j], terminator: " ")
        }
        print("")
    }
}


func getSizeMatrix(_ n: inout Int, _ m: inout Int) {
    print("Введите размеры матрицы: ", terminator: "")
    let input = readLine()!
    let nm = input.split(separator: " ").map({Int($0) ?? 0})
    
    n = nm[0]
    m = nm[1]
}


func getMatrix(_ n: Int, _ m: Int) -> [[Int]] {
    print("Введите матрицу \(n) x \(m): ")
    var matrix: [[Int]] = []
    
    for _ in 0..<n {
        let input = readLine()!
        let arrI = input.split(separator: " ").map({Int($0) ?? 0})
        matrix.append(arrI)
    }
    
    return matrix
}


func checkSizes(_ nA: Int, _ mA: Int, _ nB: Int, _ mB: Int) -> Bool {
    if mA != nB {
        print("Некорректные размеры матриц")
        return false
    }
    
    return true
}


func benchmark(_ someFunc: ([[Int]], [[Int]]) -> [[Int]], _ matrixA: [[Int]], _ matrixB: [[Int]]) -> Double {
    let countOfRepeate = 10000
    
    var sumTime = 0.0
    for _ in 0..<countOfRepeate {
        let startTime = CFAbsoluteTimeGetCurrent()
        _ = someFunc(matrixA, matrixB)
        let endTime = CFAbsoluteTimeGetCurrent()
        
        sumTime += endTime - startTime
    }
    
    return sumTime
}
