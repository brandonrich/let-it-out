//
//  Util.swift
//
//
//  Created by Brandon Rich2 on 2/6/16.
//
//

import Foundation

extension String {
    func reformatTimeString(fromFormat: String, toFormat: String ) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = fromFormat
        if let date = formatter.dateFromString(self) {
            formatter.dateFormat = toFormat
            return formatter.stringFromDate(date)
        }
        return ""
    }
}