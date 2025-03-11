//
//  BudgetDateilView.swift
//  BudgetsAPP
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/3/11.
//

import SwiftUI

struct BudgetDateilView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    let budgetCategory: BudgetCategory
    @State private var title: String = ""
    @State private var total: String = ""
    
    var isFormValid: Bool {
        guard let totalAsDouble = Double(total) else {return false}
        return !title.isEmpty && !total.isEmpty && totalAsDouble > 0
    }
    
    private func saveTransaction() {
        
        do{
            let transaction = Transaction(context: viewContext)
            transaction.title = title
            transaction.total = Double(total)!
            
            budgetCategory.addToTransactions(transaction)
            try viewContext.save()
        } catch {
            print(error) 
        }
        //budgetCategory.addToTransaction(transaction)
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack (alignment: .leading){
                    Text(budgetCategory.title ?? "")
                        .font(.largeTitle)
                    HStack{
                        Text("Budget:")
                        Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                    }.fontWeight(.bold)
                    
                }
            }
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Total", text: $total)
                } header: {
                    Text("Add Transaction")
                }
                HStack{
                    Spacer()
                    Button("Save Transaction"){
                       // saveTransaction()
                    }.disabled(!isFormValid)
                    Spacer()
                }
            }

            Spacer()
        }
       
    }
}

/*#Preview {
    BudgetDateilView()
}*/
