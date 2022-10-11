//
//  functions.swift
//  lab01
//
//  Created by poliorang on 22.09.2022.
//

import CoreFoundation
import Foundation

func createMatrix(n: Int, m: Int, fill: Int) -> Array<[Int]> {
    var matrix = [[Int]](repeating: [Int](repeating: fill, count: m), count: n)
    
    for i in 0..<n {
        matrix[i][0] = i
    }
    
    for j in 0..<m  {
        matrix[0][j] = j
    }

    return matrix
}


func printMatrix(n: Int, m : Int, matrix: [[Int]]) {
    for i in 0..<n {
        for j in 0..<m {
            print(matrix[i][j], terminator: " ")
        }
        print("\n")
    }
}


func getStrings(_ number: Int) -> String {
    print("Input №\(number): ", terminator: "")
    let input = readLine()
    return input ?? ""
}


func benchmark1(_ someFunc: (String, String) -> Int, _ firstString: String, _ secondString: String) {
    let countOfRepeate = 20
    
    var sumTime = 0.0
    for _ in 0..<countOfRepeate {
        let startTime = Date()
        _ = someFunc(firstString, secondString)
        let endTime = Date()
        
        sumTime += endTime.timeIntervalSince(startTime)
    }
    
    let middleTime = sumTime / Double(countOfRepeate)
    print("Middle time: \(middleTime) seconds.", terminator: "\n\n")
}


func benchmark(_ someFunc: (String, String) -> Int, _ firstString: String, _ secondString: String, countOfRepeate: Int) -> Double {
    
    var sumTime = 0.0
    for _ in 0..<countOfRepeate {
        let startTime = CFAbsoluteTimeGetCurrent()
        _ = someFunc(firstString, secondString)
        let endTime = CFAbsoluteTimeGetCurrent()
        
        sumTime += endTime - startTime
    }
    
//    print(countOfRepeate, " -> ", sumTime)
    return sumTime
}


