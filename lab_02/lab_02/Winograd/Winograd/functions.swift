//
//  functions.swift
//  lab01
//
//  Created by poliorang on 15.10.2022.
//

import Foundation

func generateMatrix(_ n: Int, _ m: Int) -> [[Int]] {
    var matrix = createMatrix(n: n, m: m, fill: 0)
    
    for i in 0..<n {
        for j in 0..<m {
            matrix[i][j] = Int.random(in: -1000...1000)
        }
    }
    
    return matrix
}

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

func maxCountOfSymbols(n: Int, m : Int, matrix: [[Int]]) -> Int {
    var maxNumber = matrix[0][0]
    
    for i in 0..<n {
        for j in 0..<m {
            if matrix[i][j] > maxNumber { maxNumber = matrix[i][j] }
        }
    }
    
    return String(maxNumber).count
}


func matrixToString(n: Int, m : Int, matrix: [[Int]]) -> String {
    var str = ""
    
    let countOfSymbols = maxCountOfSymbols(n: n, m: m, matrix: matrix)
    for i in 0..<n {
        for j in 0..<m {
            let symbol = String(matrix[i][j])
            str +=  String(repeating: " ", count: 1 + countOfSymbols - symbol.count) + symbol
        }
        str += "\n"
    }
    
    return str
}

public func parseMatrix(_ input: String, _ n: inout Int, _ m: inout Int, _ matrix: inout [[Int]]) -> Bool {
    let arr = input.split(separator: "\n")
    for elem in arr {
        let converNiltElem = elem.split(separator: " ").map({Int($0) ?? nil})
        
        if converNiltElem.contains(nil) {
            return false
        }
        
        let convertElem = converNiltElem.map({$0!})
        matrix.append(convertElem)
    }
    
    let rows = matrix.count
    let columns = matrix[0].count
    for arr in matrix {
        if arr.count != columns { return false }
    }
    
    n = rows
    m = columns
    
    print(n, m)
    print(matrix)
    
    return true
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
    var sum = 0.0
    
    for i in 0...50 {
        let startTime = CFAbsoluteTimeGetCurrent()
        _ = someFunc(matrixA, matrixB)
        let endTime = CFAbsoluteTimeGetCurrent()
        
        sum += endTime - startTime
    }
    
    return sum / 50
}


func getArrayOfRepeate() -> Array<Int> {
    var arr = [Int]()
    for x in stride(from: 1, to: 10000, by: 500) { arr.append(x) }
    
    return arr
}
