//
//  functions.swift
//  lab01
//
//  Created by poliorang on 15.10.2022.
//

import Foundation

func standardMultiplication(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
    let n = matrixA.count
    let m = matrixA[0].count
    let q = matrixB[0].count
    
    var matrixRes = createMatrix(n: n, m: q, fill: 0)
    
    for i in 0..<n {
        for j in 0..<q {
            for k in 0..<m {
                matrixRes[i][j] = matrixRes[i][j] + matrixA[i][k] * matrixB[k][j]
            }
        }
    }
    
    return matrixRes
}


func Winograd(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
    let n = matrixA.count
    let m = matrixA[0].count
    let q = matrixB[0].count
    
    var matrixRes = [[Int]](repeating: [Int](repeating: 0, count: q), count: n)
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
            matrixRes[i][j] = -row[i] - column[j]
            for k in 0..<(m / 2) {
                matrixRes[i][j] = matrixRes[i][j] + (matrixA[i][2 * k + 1] + matrixB[2 * k][j]) * (matrixA[i][2 * k] + matrixB[2 * k + 1][j])
            }
        }
    }
    
    if m % 2 == 1 {
        for i in 0..<n {
            for j in 0..<q {
                matrixRes[i][j] = matrixRes[i][j] + matrixA[i][m - 1] * matrixB[m - 1][j]
            }
        }
    }
    
    return matrixRes
}

func WinogradOptimal(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
    let n = matrixA.count
    let m = matrixA[0].count
    let mCycle = matrixA[0].count >> 1
    let q = matrixB[0].count
    
    var matrixRes = [[Int]](repeating: [Int](repeating: 0, count: q), count: n)
    var row = [Int](repeating: 0, count: n)
    
    
    for i in 0..<n {
        for j in 0..<mCycle {
            row[i] += matrixA[i][2 * j] * matrixA[i][2 * j + 1]
        }
    }
    
    var column = [Int](repeating: 0, count: q)
    
    for i in 0..<q {
        for j in 0..<mCycle {
            column[i] += matrixB[2 * j][i] * matrixB[2 * j + 1][i]
        }
    }
    
    for i in 0..<n {
        for j in 0..<q {
            matrixRes[i][j] = -row[i] - column[j]
            for k in 0..<mCycle {
                matrixRes[i][j] += (matrixA[i][2 * k + 1] + matrixB[2 * k][j]) * (matrixA[i][2 * k] + matrixB[2 * k + 1][j])
            }
        }
    }
    
    if m % 2 == 1 {
        for i in 0..<n {
            for j in 0..<q {
                matrixRes[i][j] += matrixA[i][m - 1] * matrixB[m - 1][j]
            }
        }
    }
    
    return matrixRes
}

