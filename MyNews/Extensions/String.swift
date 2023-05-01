//
//  String.swift
//  MyNews
//
//  Created by Aliaksandr Pustahvar on 1.05.23.
//

import Foundation

extension String {
    var asDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.date(from: self) ?? .now
    }
}
