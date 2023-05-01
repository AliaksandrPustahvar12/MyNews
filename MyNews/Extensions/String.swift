//
//  String.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 1.05.23.
//

import Foundation

extension String {
    var asDate: Date {
        var formatDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date: Date = formatter.date(from: self) {
            formatDate = date
        }
        return formatDate
       }
    }
