//
//  functions.swift
//  lab01
//
//  Created by poliorang on 15.10.2022.
//

import Foundation

func standardMultiplication(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
//    print("Standard")
    let n = matrixA.count
    let m = matrixA[0].count
    let q = matrixB[0].count
    
    resultMatrix = createMatrix(n: n, m: q, fill: 0)
    
    for i in 0..<n {
        for j in 0..<q {
            for k in 0..<m {
                resultMatrix[i][j] = resultMatrix[i][j] + matrixA[i][k] * matrixB[k][j]
            }
        }
    }
    
    return resultMatrix
}


func Winograd(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
//    print("Winograd")
    let n = matrixA.count
    let m = matrixA[0].count
    let q = matrixB[0].count
    
    resultMatrix = [[Int]](repeating: [Int](repeating: 0, count: q), count: n)
    var row = [Int](repeating: 0, count: n)
    
    for i in 0..<n {
        for j in 0..<(m / 2) {
            row[i] = row[i] + matrixA[i][2 * j] * matrixA[i][2 * j + 1]
        }
    }
    
    var column = [Int](repeating: 0, count: q)
    
    for i in 0..<q {
        for j in 0..<(m / 2) {
            column[i] = column[i] + matrixB[2 * j][i] * matrixB[2 * j + 1][i]
        }
    }
    
    for i in 0..<n {
        for j in 0..<q {
            resultMatrix[i][j] = -row[i] - column[j]
            for k in 0..<(m / 2) {
                resultMatrix[i][j] = resultMatrix[i][j] + (matrixA[i][2 * k + 1] + matrixB[2 * k][j]) * (matrixA[i][2 * k] + matrixB[2 * k + 1][j])
            }
        }
    }
    
    if m % 2 == 1 {
        for i in 0..<n {
            for j in 0..<q {
                resultMatrix[i][j] = resultMatrix[i][j] + matrixA[i][m - 1] * matrixB[m - 1][j]
            }
        }
    }
    
    return resultMatrix
}

func WinogradOptimal(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
//    print("Optimal")
    let n = matrixA.count
    let m = matrixA[0].count
    let mCycle = matrixA[0].count >> 1
    let q = matrixB[0].count
    
    resultMatrix = [[Int]](repeating: [Int](repeating: 0, count: q), count: n)
    var row = [Int](repeating: 0, count: n)
    
    
    for i in 0..<n {
        for j in 0..<mCycle {
            row[i] += matrixA[i][j * 2] * matrixA[i][j * 2 + 1]
        }
    }
    
    var column = [Int](repeating: 0, count: q)
    
    for i in 0..<q {
        for j in 0..<mCycle {
            column[i] += matrixB[j * 2][i] * matrixB[j * 2 + 1][i]
        }
    }
    
    for i in 0..<n {
        for j in 0..<q {
            resultMatrix[i][j] -= (row[i] + column[j])
            for k in 0..<mCycle {
                resultMatrix[i][j] += (matrixA[i][k * 2 + 1] + matrixB[k * 2][j]) * (matrixA[i][k * 2] + matrixB[k * 2 + 1][j])
            }
        }
    }
    
    if m % 2 == 1 {
        for i in 0..<n {
            for j in 0..<q {
                resultMatrix[i][j] += matrixA[i][m - 1] * matrixB[m - 1][j]
            }
        }
    }
    
    return resultMatrix
}
