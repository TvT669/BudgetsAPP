//
//  CoreDataManger.swift
//  BudgetsAPP
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/3/9.
//

import Foundation
import CoreData

class CoreDataManger {
    
    static let shared = CoreDataManger()
    private var persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "BudgetModel")
        persistentContainer.loadPersistentStores{description, error in
            if let error {
                fatalError("Unable to initialize Core Data stack \(error)")
            }
        }
    }
    
    /*初始化数据模型：通过 name: "BudgetModel" 指定数据模型名称（必须与 .xcdatamodeld 文件名一致）。
    ​加载持久化存储：调用 loadPersistentStores 方法自动配置数据库连接。*/
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
}

