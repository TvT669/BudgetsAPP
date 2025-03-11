//
//  NumberFormatter+Extensions.swift
//  BudgetsAPP
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/3/9.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
