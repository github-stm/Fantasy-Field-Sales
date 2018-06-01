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

    var dataSource = FFSTableDataSource()
    
    @IBOutlet weak var tableView: UITableView?
    
    @IBOutlet weak var tabView: ScrollTabView?
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    var chartData = Constants.chartData
    
    var lineChartEntry = [ChartDataEntry]()
    var lineChartEntry2 = [ChartDataEntry]()
    var allLineChartDataSets: [LineChartDataSet] = [LineChartDataSet]()
    
    
    
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

        chartView.setViewPortOffsets(left: 0, top: 20, right: 0, bottom: 0)
        chartView.backgroundColor = ColorManager.Chart.background
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        chartView.maxHighlightDistance = 300
        
        chartView.xAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
        yAxis.labelFont = font!
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = ColorManager.Chart.text
        yAxis.labelPosition = .insideChart
        yAxis.axisLineColor = ColorManager.Chart.text
        
   
        
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false
        
        self.setDataCount(Int(45), range: UInt32(100))

        chartView.animate(xAxisDuration: 2, yAxisDuration: 2)
        
        for set in chartView.data!.dataSets as! [LineChartDataSet] {
            set.drawFilledEnabled = !set.drawFilledEnabled
        }
        chartView.setNeedsDisplay()
        
    }
    

    
    func setDataCount(_ count: Int, range: UInt32) {
        let yVals11 = (0..<count).map { (i) -> ChartDataEntry in
            let mult = range + 1
            let val = Double(arc4random_uniform(mult) + 20)
            return ChartDataEntry(x: Double(i), y: val)
        }
        // https://stackoverflow.com/questions/32428637/multiple-datasets-with-different-number-of-points-on-one-chart-ios-charts
        
        
        //print(yVals11)
        
//
//
//        let yVals1 = (0..<chartData.count).map { (i) -> ChartDataEntry in
//
//            let mult = chartData[i]
//           // let mult = range + 1
//            let val = Double(arc4random_uniform(UInt32(mult.y1)))
//            return ChartDataEntry(x: Double(mult.x), y: val)
//        }
        
        
        for i in 0..<chartData.count {
            let data = chartData[i]
            let value = ChartDataEntry(x: Double(data.x), y: Double(data.y1))
            lineChartEntry.append(value)
        }
        
        let lineChartDataSet1: LineChartDataSet = LineChartDataSet(values: lineChartEntry, label: "Temperature")
        allLineChartDataSets.append(lineChartDataSet1)
        
        
        
        for i in 0..<chartData.count {
            let data = chartData[i]
            let value = ChartDataEntry(x: Double(data.x), y: Double(data.y2))
            lineChartEntry2.append(value)
        }
        
        let lineChartDataSet2: LineChartDataSet = LineChartDataSet(values: lineChartEntry2, label: "Test")
        allLineChartDataSets.append(lineChartDataSet2)
        
        /*
        let allDataPoints: [Double] = chartData.map{Double($0.x)}
        
        let lineChartData = LineChartData(xVals: allDataPoints, dataSets: allLineChartDataSets)
        
        testLineChartView.data = lineChartData
        
        */
        
        print(lineChartEntry)
     //   let set1 = LineChartDataSet(values: yVals1, label: "DataSet 1")
        let set1 = LineChartDataSet(values: lineChartEntry, label: "DataSet 1")
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 1.8
        set1.circleRadius = 4
        set1.setCircleColor(.white)
        set1.highlightColor = UIColor.red
        set1.fillColor = ColorManager.Chart.fill
        set1.fillAlpha = 1
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.fillFormatter = CubicLineSampleFillFormatter()
        
        let data = LineChartData(dataSet: set1)
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 9)!)
        data.setValueTextColor(ColorManager.Chart.text)
        data.setDrawValues(false)
        
        chartView.data = data
    }
    
    /*
    override func optionTapped(_ option: Option) {
        switch option {
        case .toggleFilled:
            for set in chartView.data!.dataSets as! [LineChartDataSet] {
                set.drawFilledEnabled = !set.drawFilledEnabled
            }
            chartView.setNeedsDisplay()
            
        case .toggleCircles:
            for set in chartView.data!.dataSets as! [LineChartDataSet] {
                set.drawCirclesEnabled = !set.drawCirclesEnabled
            }
            chartView.setNeedsDisplay()
            
        case .toggleCubic:
            for set in chartView.data!.dataSets as! [LineChartDataSet] {
                set.mode = (set.mode == .cubicBezier) ? .linear : .cubicBezier
            }
            chartView.setNeedsDisplay()
            
        case .toggleStepped:
            for set in chartView.data!.dataSets as! [LineChartDataSet] {
                set.mode = (set.mode == .stepped) ? .linear : .stepped
            }
            chartView.setNeedsDisplay()
            
        case .toggleHorizontalCubic:
            for set in chartView.data!.dataSets as! [LineChartDataSet] {
                set.mode = (set.mode == .cubicBezier) ? .horizontalBezier : .cubicBezier
            }
            chartView.setNeedsDisplay()
            
        default:
            super.handleOption(option, forChartView: chartView)
        }
    }
    */
  
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


