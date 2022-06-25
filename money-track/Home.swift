//
//  Home.swift
//  money-track
//
//  Created by Truong Nhat Anh on 25/06/2022.
//

import SwiftUI
import RealmSwift

struct Home: View {
    @State var addBalance: String = "";
    @State var expAmount: String = "";
    @State var balance: String = "200.00";
    @State var expense: String = "0.00";
    @FocusState var isFocus: Bool;
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Balance")
                    .font(.largeTitle)
                    
                Text(balance + "$")
                    .font(.title)
            }
            
            VStack(alignment: .leading) {
                Text("Today's expense")
                    .font(.largeTitle)
                Text(expense + "$")
                    .font(.title)
            }
            .padding(.top, 4)
            Spacer()
            VStack(alignment: .leading) {

                VStack(alignment: .leading) {
                    Text("Add more money")
                        .font(.title2)
                    TextField("Amount",text: $addBalance)
                        .padding(.vertical)
                        .focused($isFocus)
                    Button("Add more money", action: handleAddBalance)
                        .padding([.top, .bottom], 12)
                        .padding([.leading, .trailing], 32)
                        .background(.white)
                        .cornerRadius(8)
                }
                
                VStack(alignment: .leading) {
                    Text("You have used?")
                        .font(.title2)
                    TextField("Amount", text: $expAmount)
                        .padding(.vertical)
                        .focused($isFocus)
                    Button("Add expense", action: handleAddExp)
                        .padding([.top, .bottom], 12)
                        .padding([.leading, .trailing], 32)
                        .background(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 18)

                
                    
            }
        }   .padding()
            .background(Color.init(UIColor(rgb: 0xe3d8c3)))
            .onTapGesture {
                isFocus = false
            }
            
    }
    
    
    // TODO: Write regex to handle user's input
    
    func handleAddBalance() {
        
        if (addBalance != "") {
            balance = String(Double(balance)! + Double(addBalance)!)
            
            isFocus = false;
            let realm = try! Realm()
            let data = Record()
//            print(realm.configuration.fileURL!)
            data.amount = Double(addBalance)!;
            data.type = "add";
            try! realm.write({
                realm.add(data)
            })
            addBalance = ""
        }


    }
    
    func handleAddExp() {
        if (expAmount != "") {
            balance = String(Double(balance)! - Double(expAmount)!)
            expense = String(Double(expense)! + Double(expAmount)!)
            
            isFocus = false
            let realm = try! Realm()
            let data = Record()
            data.amount = Double(expAmount)!;
            data.type = "use";
            try! realm.write({
                realm.add(data)
            })
            expAmount = ""
        }

    }
}





struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
