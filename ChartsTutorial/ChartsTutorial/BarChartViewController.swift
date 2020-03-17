//
//  BarChartViewController.swift
//  ChartsTutorial
//
//  Created by Duy Bui on 4/20/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {

  @IBOutlet weak var barChartView: BarChartView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    barChartView.animate(xAxisDuration: 0.0, yAxisDuration: 0.0)
    barChartView.pinchZoomEnabled = false
    barChartView.drawBarShadowEnabled = false
    barChartView.drawBordersEnabled = false
    barChartView.doubleTapToZoomEnabled = false
    barChartView.drawGridBackgroundEnabled = false
    barChartView.drawValueAboveBarEnabled = false
    barChartView.drawMarkers = false
    barChartView.chartDescription?.text = "Bar Chart View"
    barChartView.chartDescription?.textColor = UIColor.red
    barChartView.backgroundColor = UIColor.clear
    barChartView.autoresizesSubviews = false
    barChartView.gridBackgroundColor = UIColor.clear
    barChartView.legend.textColor = UIColor.red
    barChartView.xAxis.axisLineColor = UIColor.red
    barChartView.xAxis.labelTextColor = UIColor.red
    barChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
    barChartView.xAxis.drawLabelsEnabled = true
    barChartView.leftAxis.axisLineColor = UIColor.red
    barChartView.leftAxis.labelTextColor = UIColor.red
    barChartView.leftAxis.drawGridLinesEnabled = true // by Default
    barChartView.leftAxis.drawAxisLineEnabled = true // by Default
    barChartView.leftAxis.drawLabelsEnabled = true // by Default
    barChartView.rightAxis.axisLineColor = UIColor.red
    barChartView.rightAxis.labelTextColor = UIColor.red
    barChartView.rightAxis.drawGridLinesEnabled = false
    barChartView.rightAxis.drawAxisLineEnabled = true
    barChartView.rightAxis.drawLabelsEnabled = true

    
    setChart(dataPoints: players, values: goals.map { Double($0) })
  }
  
  
  func setChart(dataPoints: [String], values: [Double]) {
    barChartView.noDataText = "You need to provide data for the chart."
    
    var dataEntries: [BarChartDataEntry] = []
    
    for i in 0..<dataPoints.count {
      let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
      dataEntries.append(dataEntry)
    }
    
    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Bar Chart View")
    let chartData = BarChartData(dataSet: chartDataSet)
    barChartView.data = chartData
  }
}
