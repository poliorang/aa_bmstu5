//
//  functions.swift
//  lab_03_commandTool
//
//  Created by poliorang on 20.10.2022.
//

import Foundation

func getArray(n: Int) -> [Double] {
    var array: [Double] = []
    
    print("\nВведите массив: ")
    let input = readLine()!
    array = input.split(separator: " ").map({Double($0) ?? 0})
    
    while array.count != n {
        print("\nНеверное количество элементов.\nВведите \(n) элементов: ")
        let input = readLine()!
        array = input.split(separator: " ").map({Double($0) ?? 0})
    }
    
    return array
}

func generateArrayInt(n: Int) -> [Int] {
    var array: [Int] = []
    
    for _ in 0..<n {
        array.append(Int.random(in: -1000...1000))
    }
    
    return array
}

func generateArrayDouble(n: Int) -> [Double] {
    var array: [Double] = []
    
    for _ in 0..<n {
        array.append(Double.random(in: -1000...1000))
    }
    
    return array
}

func benchmark<T>(_ someFunc: ([T], Int) -> [T], _ array: [T], _ threads: Int) -> Double {
    let startTime = CFAbsoluteTimeGetCurrent()
    _ = someFunc(array, threads)
    let endTime = CFAbsoluteTimeGetCurrent()

    return endTime - startTime
}

//func benchmark<T>(_ someFunc: ([T], Int) -> [T], _ array: [T], _ threads: Int) -> Double {
//    var sum = 0.0
//    var count = 5
//
//    for _ in 0...count {
//        let startTime = CFAbsoluteTimeGetCurrent()
//        _ = someFunc(array, threads)
//        let endTime = CFAbsoluteTimeGetCurrent()
//
//        sum += endTime - startTime
//    }
//
//    return sum / Double(count)
//}

func getSizeArray() -> Int {
    print("Введите размер массива: ", terminator: "")
    let input = readLine()!
    let n = Int(input) ?? 0
    
    return n
}
