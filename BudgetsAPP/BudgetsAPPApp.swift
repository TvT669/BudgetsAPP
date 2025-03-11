//
//  BudgetsAPPApp.swift
//  BudgetsAPP
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/3/9.
//

import SwiftUI

@main
struct BudgetsAPPApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManger.shared.viewContext)
            // Core Data 的主视图上下文 (NSManagedObjectContext) 以环境变量的形式注入到整个应用中。
        }
    }
}
