//
//  MonthYearPickerView.swift
//  FantasyFieldSales
//
//  Created by Clive Brown on 22/05/2018.
//  Copyright © 2018 CeeBee. All rights reserved.
//

import UIKit

    
    
protocol MonthYearPickerViewDelegate {
  //  func selectedRow(row:Int, rowTitle:String)
    func okButtonTapped()
    func cancelButtonTapped()
}

class MonthYearPickerView: UIView {

    var delegatePickerView: MonthYearPickerViewDelegate?
    
    @IBOutlet weak fileprivate var contentView: UIView?
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var okButton: UIButton?
    @IBOutlet weak var cancelButton: UIButton?
    @IBOutlet weak var pickerView: UIPickerView?
    @IBOutlet weak var buttonView: UIView?

    var months: [String]!
    var years: [Int]!
    
    var startMonth:Int?
    var startYear:Int?
    
    var month:Int?
    var year:Int?
    
    convenience init(frame: CGRect, startMonth:Int, startYear:Int) {
        self.init(frame: frame)
        self.startMonth = startMonth
        self.startYear = startYear
        selectedRowPicker()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalizeSubviews()
        self.commonSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initalizeSubviews()
        self.commonSetup()
    }

    //needed to set frame of xib  to correct size in swift 3
    override func layoutSubviews() {
        self.contentView?.frame = bounds
    }
    
    func initalizeSubviews() {
        let subviewArray = Bundle.main.loadNibNamed("MonthYearPickerView", owner: self, options: nil)
        self.addSubview(subviewArray!.first as! UIView)
    }
    
    
    func commonSetup() {
        
        let font = UIFont(name: Constants.font.regularFont, size:  Constants.fontSize.smallFontSize)
        
        buttonView?.backgroundColor = ColorManager.Calendar.buttonView
        for button: UIButton in buttons {
            button.titleLabel?.font = font
            button.titleLabel?.textAlignment = .center
            button.layer.borderColor = ColorManager.CallToActionButton.border.cgColor
            
            button.layer.borderWidth = 2.0
            button.setBackgroundImage(UIImage().imageWithColor(ColorManager.CallToActionButton.backgroundNormal), for: .normal)
            button.setBackgroundImage(UIImage().imageWithColor(ColorManager.CallToActionButton.backgroundHighlight), for: .highlighted)
            button.setTitleColor(ColorManager.CallToActionButton.textNormal, for: .normal)
            button.setTitleColor(ColorManager.CallToActionButton.textHighlight, for: .highlighted)
            
        }

        // population years
        var years: [Int] = []
        if years.count == 0 {
            var year = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)
            for _ in 1...15 {
                years.append(year)
                year += 1
            }
        }
        self.years = years
        
        // population months with localized names
        var months: [String] = []
        var mth = 0
        for _ in 1...12 {
            months.append(DateFormatter().monthSymbols[mth].capitalized)
            mth += 1
        }
        self.months = months
        self.pickerView?.dataSource = self
        self.pickerView?.delegate = self
        
        month = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.month, from: NSDate() as Date)
        year = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)

    }
    
    
    func selectedRowPicker(){
        if let month = startMonth, let year = startYear {
            pickerView?.selectRow(month - 1, inComponent: 0, animated: false)
            let currentYear = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)
            
            pickerView?.selectRow(abs(currentYear - year), inComponent: 1, animated: false)
        }  else {
            pickerView?.selectRow(month! - 1, inComponent: 0, animated: false)
        }
        
    }
    @IBAction func okButtonTapped(_ sender: AnyObject)
    {
        if let delegate = self.delegatePickerView {
            if let year = self.year, let month = self.month, let date = Calendar.current.date(from: DateComponents(year: year, month: month, day: 15)) {
                 delegate.okButtonTapped()
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notification.dateSelectedNotification), object: nil, userInfo: ["date": date])
            }
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject)
    {
        if let delegate = self.delegatePickerView {
            delegate.cancelButtonTapped()
        }
    }

}

 // Mark: UIPicker Delegate

extension  MonthYearPickerView:  UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.month = pickerView.selectedRow(inComponent: 0)+1
        self.year = years[pickerView.selectedRow(inComponent: 1)]
    }
}


 // Mark: UIPicker  Data Source

extension  MonthYearPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return months[row]
        case 1:
            return "\(years[row])"
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return months.count
        case 1:
            return years.count
        default:
            return 0
        }
    }
}


