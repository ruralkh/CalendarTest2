//
//  ViewController.swift
//  CalendarTest2
//
//  Created by Ron Rith on 1/17/19.
//  Copyright © 2019 Ron Rith. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {
let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension ViewController: JTAppleCalendarViewDataSource{
    
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2019 01 01")!
        let endDate = formatter.date(from: "2019 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    
}

extension ViewController: JTAppleCalendarViewDelegate{
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        
        cell.layer.cornerRadius = 7
        cell.layer.borderWidth = 0
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let validCell = cell as? CustomCell else {return}
        validCell.selectedView.isHidden = false
    }
    
}
