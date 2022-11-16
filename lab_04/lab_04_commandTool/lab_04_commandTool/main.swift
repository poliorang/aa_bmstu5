//
//  main.swift
//  lab_04_commandTool
//
//  Created by poliorang on 16.11.2022.
//

import Foundation

let n = getSizeArray()

print("\nСгенерировать массив? y/n")
var answer = readLine()

var arr: [Double] = []
if answer == "y" {
    print("\nDouble / Int? d/i")
    answer = readLine()
    if answer == "i" {
        let arrInt = generateArrayInt(n: n)
        arr = arrInt.map{ Double($0) }
    } else {
        arr = generateArrayDouble(n: n)
    }
    print(arr)
} else if answer == "n" {
    arr = getArray(n: n)
}



print("\nКоличество потоков? 1 / 2 / 4 / 8 / 16")
answer = readLine()
let countOfThread = Int(answer!) ?? 0
if countOfThread == 0 {
    print("Некорректное коилчество потоков")
}

let arr1 = arr
let arr2 = arr

if countOfThread == 1 {
    print("\nСортировка блочная")
    var time = benchmark(bucketSort, arr1, countOfThread)
    print("Время |", time)

    print("\nСортировка блочная")
    time = benchmark(bucketSort, arr2, countOfThread)
    print("Время |", time)
    
} else {
    print("\nСортировка блочная")
    var time = benchmark(bucketSort, arr1, countOfThread)
    print("Время |", time)

    print("\nСортировка блочная")
    time = benchmark(bucketSortWithParallel, arr2, countOfThread)
    print("Время |", time)
}




// test
//let countOfElements = [10000, 20000, 30000, 40000, 50000]
//let countOfThreads = [1, 2, 4, 8, 16, 32, 64]
//
//for n in countOfElements {
//    print("\nКоличество элементов массива: \(n)")
//    let arrInt = generateArrayInt(n: n)
//    let arr = arrInt.map{ Double($0) }
//
//    let arr1 = arr
//    print("\nСортировка блочная")
//    let time = benchmark(bucketSort, arr1, 0)
//    print("Время |", time)
//
//    for i in countOfThreads {
//        let arr2 = arr
//
//        print("\nСортировка блочная c \(i) потоками")
//        let time = benchmark(bucketSortWithParallel, arr2, i)
//        print("Время |", time)
//    }
//}
