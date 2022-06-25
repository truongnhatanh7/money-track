//
//  Home.swift
//  money-track
//
//  Created by Truong Nhat Anh on 25/06/2022.
//

import SwiftUI

struct Home: View {
    @State var addBalance: String = "";
    @State var expAmount: String = "";
    @State var balance: String = "200.00";
    @State var expense: String = "0.00";
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
                    Button("Add expense", action: handleAddExp)
                        .padding([.top, .bottom], 12)
                        .padding([.leading, .trailing], 32)
                        .background(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 18)

                
                    
            }
        }   .padding()
            .background(Color.init(UIColor(rgb: 0xd4d29b)))
            
    }
    
    func handleAddBalance() {
        balance = String(Double(balance)! + Double(addBalance)!)
        addBalance = ""
    }
    
    func handleAddExp() {
        balance = String(Double(balance)! - Double(expAmount)!)
        expense = String(Double(expense)! + Double(expAmount)!)
        expAmount = ""
    }
}





struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
