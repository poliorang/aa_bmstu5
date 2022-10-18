//
//  SecondViewController.swift
//  WinogradLab
//
//  Created by poliorang on 18.10.2022.
//

import UIKit
import Charts

var colorsGraph = [UIColor.systemBrown, UIColor.cyan, UIColor.lightGray, UIColor.systemYellow]
public var lineChart = LineChartView()
public var arr = [Int]()

class SecondViewController: UIViewController, ChartViewDelegate {
    var mainViewController: ViewController?
    
    @IBOutlet weak var methodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewController?.showSpinner()
        lineChart.delegate = self
        
        setupLineCharts()
        setupLabel()
        view.addSubview(lineChart)
        
        arr = getArrayOfRepeate()
        getPraph()
    }
    
    func setupLineCharts() {
        if view.frame.size.width > 420 {
            lineChart.frame = CGRect(x: 0, y: 200, width: view.frame.size.width - 120, height: view.frame.size.width - 200)
        } else {
            lineChart.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: view.frame.size.width)
        }
    }
    
    func setupLabel() {
        methodLabel.text = methodsArray[currentMethod]
    }
    
    func getPraph() {
        var dataSets = [ChartDataSet]()
        var times = [Double]()
        
        if currentMethod == 3 {
            let _ = goBenchmark(standardMultiplication) // костыль
            
            for i in 0..<3 {
                var entries = [ChartDataEntry]()
                
                switch i {
                case 0:
                    times = goBenchmark(standardMultiplication)
                case 1:
                    times = goBenchmark(Winograd)
                default:
                    times = goBenchmark(WinogradOptimal)
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
            switch currentMethod {
            case 0:
                _ = goBenchmark(standardMultiplication)
                times = goBenchmark(standardMultiplication)
            case 1:
                _ = goBenchmark(Winograd)
                times = goBenchmark(Winograd)
            default:
                _ = goBenchmark(WinogradOptimal)
                times = goBenchmark(WinogradOptimal)
            }
            
            var entries = [ChartDataEntry]()
            for i in 0..<arr.count {
                entries.append(ChartDataEntry(x: Double(arr[i]), y: times[i]))
            }
            let set = LineChartDataSet(entries: entries, label: methodsArray[currentMethod])
            dataSets.append(set)
        }
        
        let lineChartD = LineChartData(dataSets: dataSets)
        lineChart.data = lineChartD

    }
}
