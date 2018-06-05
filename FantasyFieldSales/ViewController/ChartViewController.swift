//
//  ChartViewController.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 15/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit
import Charts

private class CubicLineSampleFillFormatter: IFillFormatter {
    func getFillLinePosition(dataSet: ILineChartDataSet, dataProvider: LineChartDataProvider) -> CGFloat {
        return -10
    }
}



class ChartViewController: UIViewController {
    
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var tabView: ScrollTabView?
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize) ?? UIFont.systemFont(ofSize: 15, weight: .light)
    
    var chartData = Constants.chartData
    var dataSource = FFSTableDataSource()
    var lineChartEntry = [ChartDataEntry]()
    var lineChartEntry2 = [ChartDataEntry]()
    var allLineChartDataSets: [LineChartDataSet] = [LineChartDataSet]()
    
    var shouldHideData = false
    
    
    // ------------------------------------------------------------------------------------------------------------
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        NotificationCenter.default.addObserver(self, selector:#selector(FullTableViewController.dateSelected(_:)), name: NSNotification.Name(rawValue: Constants.Notification.dateSelectedNotification), object: nil)
    }
    
    @objc func dateSelected(_ notification: Notification){
        if let info = notification.userInfo, let infoDescription = info["date"] as? Date {
            print(infoDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dataSource.delegate = self
        self.tableView?.delegate = self.dataSource
        self.tableView?.dataSource = self.dataSource
        
        self.title =  Constants.text.stats.uppercased()
        
        tabView?.delegate = self

        //Set table height to cover entire view
        //if navigation bar is not translucent, reduce navigation bar height from view height
        tableHeight.constant = Constants.leagueTable.rowHeight + Constants.leagueTable.headerHeight
        self.tableView?.isScrollEnabled = false

        tabView?.reloadData(data: Constants.teamGroup)

        setUpChart()
 
        
    }
    

     func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        //self.setDataCount(Int(sliderX.value) + 1, range: UInt32(sliderY.value))
    }
    
    
    func setUpChart(){
        chartView.setViewPortOffsets(left: 0, top: 20, right: 0, bottom: 50)
        chartView.backgroundColor = ColorManager.Chart.background
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
       // chartView.maxHighlightDistance = 300
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = true
        
        setupYAxis()
        setupXAxis()
        setChartData()
        
        
        let marker = XYMarkerView(color: UIColor(white: 180/250, alpha: 1),
                                  font: .systemFont(ofSize: 14),
                                  textColor: .white,
                                  insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8),
                                  xAxisValueFormatter: chartView.xAxis.valueFormatter!)
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        chartView.marker = marker

        
        chartView.animate(xAxisDuration: 2, yAxisDuration: 2)
        for set in chartView.data!.dataSets as! [LineChartDataSet] {
            set.drawFilledEnabled = !set.drawFilledEnabled
        }
 
        chartView.setNeedsDisplay()
    }
    
    
    func setupXAxis(){
        
        //set Up xAxis
        let xAxis = chartView.xAxis
        xAxis.enabled = true
        xAxis.labelPosition = .bottomInside
        xAxis.axisMinimum = 0
        xAxis.granularity = 1
        
        xAxis.labelFont = font
        // xAxis.setLabelCount(6, force: true)
        xAxis.labelTextColor = ColorManager.Chart.text
        xAxis.labelPosition = .bottomInside
        xAxis.axisLineColor = ColorManager.Chart.text
        xAxis.labelPosition = XAxis.LabelPosition.bottom
    }
    
    
    func setupYAxis(){
        let yAxis = chartView.leftAxis

        yAxis.labelFont = font
        yAxis.labelTextColor = ColorManager.Chart.text
        yAxis.labelPosition = .insideChart
        yAxis.axisLineColor = ColorManager.Chart.text
    }
    
    func getLineChartDataSet(values: [ChartDataEntry], lineColor:UIColor, fillColor:UIColor, fillalpha: CGFloat, label:String) -> LineChartDataSet{

        let lineChartDataSet: LineChartDataSet = LineChartDataSet(values: values, label: label)
        
        lineChartDataSet.lineWidth = 2
        lineChartDataSet.setColor(lineColor)
        lineChartDataSet.mode = .cubicBezier
        lineChartDataSet.drawCirclesEnabled = false
        lineChartDataSet.fillColor = fillColor
        lineChartDataSet.fillAlpha = fillalpha
        lineChartDataSet.drawHorizontalHighlightIndicatorEnabled = false
        lineChartDataSet.fillFormatter = CubicLineSampleFillFormatter()
        lineChartDataSet.drawValuesEnabled = false
        
        return lineChartDataSet
    }
    
    func getLineEntry() -> [ChartDataEntry]{
        
        var chartDataEntry: [ChartDataEntry] = []
        for i in 0..<chartData.count {
            let data = chartData[i]
            let value = ChartDataEntry(x: Double(data.x), y: Double(data.y1))
            chartDataEntry.append(value)
        }
        
        return chartDataEntry
    }

    func getAverageLineEntry() -> [ChartDataEntry]{
        var chartDataEntry: [ChartDataEntry] = []
        for i in 0..<chartData.count {
            let data = chartData[i]
            let value = ChartDataEntry(x: Double(data.x), y: Double(data.y2))
            chartDataEntry.append(value)
        }
        
        return chartDataEntry
    }
    
    func setChartDataSet() {

        let lineDataSet = getLineChartDataSet(values: getLineEntry(), lineColor: ColorManager.Chart.line, fillColor:ColorManager.Chart.fill, fillalpha: 0.7, label:"Team")
        allLineChartDataSets.append(lineDataSet)
        

        let lineDataSet2 = getLineChartDataSet(values: getAverageLineEntry(), lineColor: ColorManager.Chart.avgLine, fillColor:ColorManager.Chart.avgFill, fillalpha: 0.7, label:"Average")
        allLineChartDataSets.append(lineDataSet2)

    }
    
    
    func setChartData() {

        setChartDataSet()
        let data = LineChartData(dataSets: allLineChartDataSets)
        data.setValueFont(font)
        chartView.data = data

    }
    

}


extension ChartViewController: FFSTableDataSourceDelegate {
    
    func selectedItem(tableView: UITableView,  indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}

extension ChartViewController :ScrollTabViewDelegate {
    func selectedItem(indexPath: IndexPath) {
        print("2 header view indexpath row\(indexPath.row)")
    }
}





