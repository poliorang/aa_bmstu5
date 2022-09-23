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

class SecondViewController: UIViewController, ChartViewDelegate {
    var mainViewController: ViewController?
    
    var lineChart = LineChartView()
    
    var arr = [Int]()

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


    func go(_ someFunc: (String, String) -> Int) -> Array<Double> {
        var times = [Double]()
        for i in arr {
            let res = benchmark(someFunc, firstWord, secondWord, countOfRepeate: i)
            times.append(res)
        }
        return times
    }
    
    func setupLineCharts() {
        lineChart.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width)
        lineChart.center = view.center
    }
    
    func setupLabels() {
        firstLabel.text = "| " + firstWord
        secondLabel.text = "| " + secondWord
        resultLabel.text = "Levenshtein distanse is \(DamerauLevenshteinRecursiveWithCash(firstWord, secondWord))"
    }
    
    func getPraph() {
        if currentFunction == 3 {
            var entries1 = [ChartDataEntry]()
            var entries2 = [ChartDataEntry]()
            var entries3 = [ChartDataEntry]()
            let _ = go(DamerauLevenshteinRecursiveWithCash) // костыль
            let times1 = go(DamerauLevenshteinRecursiveWithCash)
            let times2 = go(DamerauLevenshteinMatrix)
            let times3 = go(DamerauLevenshteinRecursive)
            
            
            for i in 0..<arr.count {
                entries1.append(ChartDataEntry(x: Double(arr[i]), y: times1[i]))
                entries2.append(ChartDataEntry(x: Double(arr[i]), y: times2[i]))
                entries3.append(ChartDataEntry(x: Double(arr[i]), y: times3[i]))
            }
            
            var dataSets = [ChartDataSet]()
            
            let set1 = LineChartDataSet(entries: entries1, label: "Matrix")
            set1.fillColor = UIColor.red
            set1.setCircleColor(UIColor.red)
            set1.setColor(UIColor.systemPink)
            
            let set2 = LineChartDataSet(entries: entries2, label: "Recursive with cash")
            
            let set3 = LineChartDataSet(entries: entries3, label: "Recursive")
            set3.fillColor = UIColor.green
            set3.setCircleColor(UIColor.green)
            set3.setColor(UIColor.green)
            
            
            dataSets.append(set1)
            dataSets.append(set2)
            dataSets.append(set3)
            
            let lineChartD = LineChartData(dataSets: dataSets)
            lineChart.data = lineChartD
        }
        else {
            var times = [Double]()
            if currentFunction == 0 {
                _ = go(DamerauLevenshteinRecursiveWithCash)
                times = go(DamerauLevenshteinRecursive)
            }
            if currentFunction == 1 {
                _ = go(DamerauLevenshteinRecursiveWithCash)
                times = go(DamerauLevenshteinMatrix)
            }
            if currentFunction == 2 {
                _ = go(DamerauLevenshteinRecursiveWithCash)
                times = go(DamerauLevenshteinRecursiveWithCash)
            }
            
            var entries = [ChartDataEntry]()
            
            for i in 0..<arr.count {
                entries.append(ChartDataEntry(x: Double(arr[i]), y: times[i]))
            }
            let set = LineChartDataSet(entries: entries, label: function[currentFunction])
            var dataSets = [ChartDataSet]()
            dataSets.append(set)
            let lineChartD = LineChartData(dataSets: dataSets)
            lineChart.data = lineChartD
        }
        
    }
    
    func getArrayOfRepeate() -> Array<Int> {
        var arr = [Int]()
        for x in stride(from: 1000, to: 4000, by: 100) {
            arr.append(x)
        }
        
        return arr
    }
}
