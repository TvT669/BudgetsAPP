//
//  BudgetListView.swift
//  BudgetsAPP
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/3/11.
//

import SwiftUI

struct BudgetListView: View {
    
    let budgetCategoryResults: FetchedResults<BudgetCategory>
    let onDeleteBudgetCategory: (BudgetCategory) -> Void
    
    var body: some View {
        List {
            
            if !budgetCategoryResults.isEmpty {
                
                ForEach(budgetCategoryResults) { budgetCategory in
                    NavigationLink(value: budgetCategory) {
                        HStack{
                            Text(budgetCategory.title ?? "")
                            Spacer()
                            VStack{
                                Text(budgetCategory.total as NSNumber,formatter:
                                        NumberFormatter.currency)
                            }
                        }
                    }
                }.onDelete { indexSet in
                    indexSet.map { budgetCategoryResults[$0] }.forEach(onDeleteBudgetCategory)
                }
            } else {
                Text("No budget categories exits.")
            }
        }.navigationDestination(for: BudgetCategory.self) { budgetCategory in
            BudgetDateilView(budgetCategory: budgetCategory)
        }
    }
    
}
