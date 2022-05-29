//
//  TableShowViewController.swift
//  SwingWatch
//
//  Created by Dan Anderton on 29/05/2022.
//  Copyright © 2022 Apple Inc. All rights reserved.
//

import UIKit
import Charts

class TableShowViewController: UIViewController {
    
    @IBOutlet weak var lineChart: LineChartView!
    
    
    var contactIndex = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    @IBOutlet weak var shot: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tablecounter = Array(stride(from: 1, through: appDelegate.shots.count, by: 1))
        
        shot.text = "Shot \(tablecounter[contactIndex]): \(appDelegate.shots[contactIndex])"

//        shot.text = "Shot "appDelegate.shots[contactIndex]
        
        var line_entries = [BarChartDataEntry]()
        
        for x in 0...119 {
            line_entries.append(BarChartDataEntry(x: Double(x)/80.0, y: appDelegate.rotX_edit[x]))
        }
        
        updateLineChart(line_entries: line_entries, name: "X Rotation")
    }
    
    func updateLineChart(line_entries: [BarChartDataEntry], name: String) {
    
        
        let set2 = LineChartDataSet(entries: line_entries, label: name)
        
        set2.colors = [NSUIColor(red: CGFloat(80.0/255), green: CGFloat(33.0/255), blue: CGFloat(222.0/255), alpha: 1)]
//        set2.colors = ChartColorTemplates.pastel()
        self.lineChart.legend.verticalAlignment = .top
        self.lineChart.legend.horizontalAlignment = .left
        set2.drawCirclesEnabled = false;
        set2.lineWidth = 5.5
        
        set2.drawValuesEnabled = false
        
        
        let data2 = LineChartData(dataSet: set2)
        lineChart.data = data2
        lineChart.noDataText = "You need to register a shot for this chart to display!"
//        lineChart.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        lineChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        lineChart.drawMarkers = false
        lineChart.rightAxis.enabled = false
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.drawLabelsEnabled = true
        
    }
    
    
    
    @IBAction func displayXAcc(_ sender: Any) {
        var line = [BarChartDataEntry]()
        for x in 0...119 {
            line.append(BarChartDataEntry(x: Double(x)/80.0, y: appDelegate.accX_edit[x]))
        }
        updateLineChart(line_entries: line, name: "X Acceleration")
    }
    @IBAction func displayYAcc(_ sender: Any) {
        var line = [BarChartDataEntry]()
        for x in 0...119 {
            line.append(BarChartDataEntry(x: Double(x)/80.0, y: appDelegate.accY_edit[x]))
        }
        updateLineChart(line_entries: line, name: "Y Acceleration")
    }
    @IBAction func displayZAcc(_ sender: Any) {
        var line = [BarChartDataEntry]()
        for x in 0...119 {
            line.append(BarChartDataEntry(x: Double(x)/80.0, y: appDelegate.accZ_edit[x]))
        }
        updateLineChart(line_entries: line, name: "Z Acceleration")
    }
    @IBAction func displayXGyro(_ sender: Any) {
        var line = [BarChartDataEntry]()
        for x in 0...119 {
            line.append(BarChartDataEntry(x: Double(x)/80.0, y: appDelegate.rotX_edit[x]))
        }
        updateLineChart(line_entries: line, name: "X Rotation")
    }
    @IBAction func displayYGyro(_ sender: Any) {
        var line = [BarChartDataEntry]()
        for x in 0...119 {
            line.append(BarChartDataEntry(x: Double(x)/80.0, y: appDelegate.rotY_edit[x]))
        }
        updateLineChart(line_entries: line, name: "Y Rotation")
    }
    @IBAction func displayZGyro(_ sender: Any) {
        var line = [BarChartDataEntry]()
        for x in 0...119 {
            line.append(BarChartDataEntry(x: Double(x)/80.0, y: appDelegate.rotZ_edit[x]))
        }
        updateLineChart(line_entries: line, name: "Z Rotation")
    }
    

}