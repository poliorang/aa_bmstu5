//
//  Algorithms.swift
//  lab01
//
//  Created by poliorang on 21.09.2022.
//

func LevenshteinMatrix(_ firstString: String, _ secondString: String) -> Int {
    let n = firstString.count
    let m = secondString.count
    
    var matrix = createMatrix(n: n + 1, m: m + 1, fill: 0)
    
    for i in 1...n {
        for j in 1...m {
            let symbolN = firstString.index(firstString.startIndex, offsetBy: i - 1)
            let symbolM = secondString.index(secondString.startIndex, offsetBy: j - 1)
            
            let insertOperation = matrix[i - 1][j] + 1
            let deleteOperation = matrix[i][j - 1] + 1
            var changeOperation = matrix[i - 1][j - 1]
            
            if firstString[symbolN] != secondString[symbolM] {
                changeOperation += 1
            }
            
            matrix[i][j] = min(insertOperation, deleteOperation, changeOperation)
        }
    }
    
//    print("Матрица - расстояние Левенштейна итеративно:\n")
//    printMatrix(n: n, m: m, matrix: matrix)
    return matrix[n][m]
}

func DamerauLevenshteinRecursive(_ firstString: String, _ secondString: String) -> Int {
    let n = firstString.count
    let m = secondString.count
    
    if n == 0 || m == 0 {
        if n != 0 { return n }
        if m != 0 { return m }
        
        return 0
    }
    
    let symbolN = firstString.index(before: firstString.endIndex)
    let symbolM = secondString.index(before: secondString.endIndex)
    
    let a = String(firstString[..<symbolN])
    let b = String(secondString[..<symbolM])
    
    var change = 0
    if firstString[symbolN] != secondString[symbolM] {
        change += 1
    }
    
    let insertOperation = DamerauLevenshteinRecursive(a, secondString) + 1
    let deleteOperation = DamerauLevenshteinRecursive(firstString, b) + 1
    let changeOperation = DamerauLevenshteinRecursive(a, b) + change
    
    if n > 1 && m > 1 {
        let symbolNMinusOne = firstString.index(firstString.endIndex, offsetBy: -2)
        let symbolMMinusOne = secondString.index(secondString.endIndex, offsetBy: -2)
        let c = String(firstString[..<symbolNMinusOne])
        let d = String(secondString[..<symbolMMinusOne])
        
        
        if firstString[symbolN] == secondString[symbolMMinusOne] && firstString[symbolNMinusOne] == secondString[symbolM] {
            let transposeOperation = DamerauLevenshteinRecursive(c, d) + 1
            return min(insertOperation, deleteOperation, changeOperation, transposeOperation)
        }
    }
    
    return min(insertOperation, deleteOperation, changeOperation)
}


func DamerauLevenshteinMatrix(_ firstString: String, _ secondString: String) -> Int {
    let n = firstString.count
    let m = secondString.count
    
    var matrix = createMatrix(n: n + 1, m: m + 1, fill: 0)
    
    for i in 1...n {
        for j in 1...m {
            let symbolN = firstString.index(firstString.startIndex, offsetBy: i - 1)
            let symbolM = secondString.index(secondString.startIndex, offsetBy: j - 1)
            
            let insertOperation = matrix[i - 1][j] + 1
            let deleteOperation = matrix[i][j - 1] + 1
            var changeOperation = matrix[i - 1][j - 1]
            
            if firstString[symbolN] != secondString[symbolM] {
                changeOperation += 1
            }
            
            if i > 1 && j > 1 {
                let symbolNMinusOne = firstString.index(firstString.startIndex, offsetBy: i - 2)
                let symbolMMinusOne = secondString.index(secondString.startIndex, offsetBy: j - 2)

                if firstString[symbolN] == secondString[symbolMMinusOne] && firstString[symbolNMinusOne] == secondString[symbolM] {
                    let transposeOperation = matrix[i - 2][j - 2] + 1
                    matrix[i][j] = min(insertOperation, deleteOperation, changeOperation, transposeOperation)
                } else {
                    matrix[i][j] = min(insertOperation, deleteOperation, changeOperation)
                }
            }
        }
    }
    
//    print("Матрица - расстояние Дамерау-Левенштейна итеративно:\n")
//    printMatrix(n: n + 1, m: m + 1, matrix: matrix)
    return matrix[n][m]
}

func DamerauLevenshteinRecursiveWithCash(_ firstString: String, _ secondString: String) -> Int {
    let n = firstString.count
    let m = secondString.count

    func recursive(firstString: String, secondString: String, n: Int, m: Int, matrix: inout [[Int]]) -> Int {
        if matrix[n][m] != -1 { return matrix[n][m] }

        let symbolN = firstString.index(firstString.startIndex, offsetBy: n - 1)
        let symbolM = secondString.index(secondString.startIndex, offsetBy: m - 1)


        var change = 0
        if firstString[symbolN] != secondString[symbolM] {
            change = 1
        }

        let insertOperation = recursive(firstString: firstString, secondString: secondString, n: n - 1, m: m, matrix: &matrix) + 1
        let deleteOperation = recursive(firstString: firstString, secondString: secondString, n: n, m: m - 1, matrix: &matrix) + 1
        let changeOperation = recursive(firstString: firstString, secondString: secondString, n: n - 1, m: m - 1, matrix: &matrix) + change


        if n > 1 && m > 1 {
            let symbolNMinusOne = firstString.index(firstString.startIndex, offsetBy: n - 2)
            let symbolMMinusOne = secondString.index(secondString.startIndex, offsetBy: m - 2)
            
            matrix[n][m] = min(insertOperation, deleteOperation, changeOperation)
            if firstString[symbolN] == secondString[symbolMMinusOne] && firstString[symbolNMinusOne] == secondString[symbolM] {

                let transposeOperation = recursive(firstString: firstString, secondString: secondString, n: n - 2, m: m - 2, matrix: &matrix) + 1
                matrix[n][m] = min(insertOperation, deleteOperation, changeOperation, transposeOperation)
            }
        } else {
            matrix[n][m] = min(insertOperation, deleteOperation, changeOperation)
        }

        return matrix[n][m]
    }

    var matrix =  createMatrix(n: n + 1, m: m + 1, fill: -1)
    _ = recursive(firstString: firstString, secondString: secondString, n: n, m: m, matrix: &matrix)

//    print("Матрица - расстояние Дамерау-Левенштейна рекурсивно с кэшем:\n")
//    printMatrix(n: n + 1, m: m + 1, matrix: matrix)
    return matrix[n][m]
}
