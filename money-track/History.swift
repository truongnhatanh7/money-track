//
//  History.swift
//  money-track
//
//  Created by Truong Nhat Anh on 25/06/2022.
//

import SwiftUI
import RealmSwift

struct History: View {
    let realm = try! Realm();
    
    var records: Array<Record> {
        return Array(realm.objects(Record.self))
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(records, id: \.self) { record in
                    HistoryRow(record: record)
                }
            }
            
        }
    }
}

struct HistoryRow: View {
    var record: Record?
    
    var body: some View {
        HStack {
            Text(record!.type == "add" ? "You added " + String(record!.amount) + "$" : "You spent " + String(record!.amount) + "$")
            
        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
