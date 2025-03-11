//
//  Transaction+CoreDataClass.swift
//  BudgetsAPP
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/3/11.
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject{
    
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
}
