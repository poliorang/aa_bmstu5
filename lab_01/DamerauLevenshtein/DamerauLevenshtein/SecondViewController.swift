//
//  SecondViewController.swift
//  DamerauLevenshtein
//
//  Created by poliorang on 23.09.2022.
//

import UIKit
import Charts

var firstWordLabel = UILabel()
var secondWordLabel = UILabel()
var colorsGraph = [UIColor.systemBrown, UIColor.cyan, UIColor.systemPurple, UIColor.systemYellow]
public var lineChart = LineChartView()
public var arr = [Int]()

class SecondViewController: UIViewController, ChartViewDelegate {
    var mainViewController: ViewController?

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewController?.showSpinner()
        lineChart.delegate = self
        
        setupLabels()
        setupLineCharts()
        view.addSubview(lineChart)
        
        arr = getArrayOfRepeate()
        getPraph()
    }

    func goBenchmark(_ someFunc: (String, String) -> Int) -> Array<Double> {
        var times = [Double]()
        for i in arr {
            let res = benchmark(someFunc, firstWord, secondWord, countOfRepeate: i)
            times.append(res)
        }
        return times
    }
    
    func setupLineCharts() {
        if view.frame.size.width > 420 {
            lineChart.frame = CGRect(x: 0, y: 200, width: view.frame.size.width - 120, height: view.frame.size.width - 200)
        } else {
            lineChart.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: view.frame.size.width)
        }
    }
    
    func setupLabels() {
        firstLabel.text = "| " + firstWord
        secondLabel.text = "| " + secondWord
        switch currentFunction {
        case 3:
            resultLabel.text = "Растояние Л = \(LevenshteinMatrix(firstWord, secondWord))"
        case 4:
            resultLabel.text = "Расстояние Л = \(LevenshteinMatrix(firstWord, secondWord)) \n Расстоние Д-Л = \(DamerauLevenshteinRecursiveWithCash(firstWord, secondWord))"
        default:
            resultLabel.text = "Растояние Д-Л = \(DamerauLevenshteinRecursiveWithCash(firstWord, secondWord))"
        }
    }
    
    func getPraph() {
        var dataSets = [ChartDataSet]()
        var times = [Double]()
        
        if currentFunction == 4 {
            let _ = goBenchmark(DamerauLevenshteinRecursiveWithCash) // костыль
            
            for i in 0..<4 {
                var entries = [ChartDataEntry]()
                
                switch i {
                case 0:
                    times = goBenchmark(DamerauLevenshteinRecursive)
                case 1:
                    times = goBenchmark(DamerauLevenshteinMatrix)
                case 2:
                    times = goBenchmark(DamerauLevenshteinRecursiveWithCash)
                default:
                    times = goBenchmark(LevenshteinMatrix)
                }
                
                for j in 0..<arr.count {
                    entries.append(ChartDataEntry(x: Double(arr[j]), y: times[j]))
                }
                
                let set = LineChartDataSet(entries: entries, label: methodsArray[i])
                set.fillColor = colorsGraph[i]
                set.setCircleColor(colorsGraph[i])
                set.setColor(colorsGraph[i])
                
                dataSets.append(set)
            }
        } else {
            switch currentFunction {
            case 0:
                _ = goBenchmark(DamerauLevenshteinRecursiveWithCash)
                times = goBenchmark(DamerauLevenshteinRecursive)
            case 1:
                _ = goBenchmark(DamerauLevenshteinRecursiveWithCash)
                times = goBenchmark(DamerauLevenshteinMatrix)
            case 2:
                _ = goBenchmark(DamerauLevenshteinRecursiveWithCash)
                times = goBenchmark(DamerauLevenshteinRecursiveWithCash)
            default:
                _ = goBenchmark(LevenshteinMatrix)
                times = goBenchmark(LevenshteinMatrix)
            }
            
            var entries = [ChartDataEntry]()
            for i in 0..<arr.count {
                entries.append(ChartDataEntry(x: Double(arr[i]), y: times[i]))
            }
            let set = LineChartDataSet(entries: entries, label: methodsArray[currentFunction])
            dataSets.append(set)
        }
        
        let lineChartD = LineChartData(dataSets: dataSets)
        lineChart.data = lineChartD

    }
    
    func getArrayOfRepeate() -> Array<Int> {
        var arr = [Int]()
        for x in stride(from: 1, to: 2100, by: 100) {
            arr.append(x)
        }
        
        return arr
    }
}
