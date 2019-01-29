//
//  Date+Ext.swift
//  boothnoire
//
//  Created by Michael Westbrooks on 9/23/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation

extension Date {
    
    func getMonthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getMonthDayName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getMonthYearName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
    func getMonthDayYearName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d YY"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
}
