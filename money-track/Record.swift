//
//  Record.swift
//  money-track
//
//  Created by Truong Nhat Anh on 25/06/2022.
//

import Foundation
import RealmSwift

class Record: Object, Identifiable {
    @objc dynamic var id: UUID = UUID();
    @objc dynamic var type: String = "";
    @objc dynamic var amount: Double = 0.0;
    @objc dynamic var timestamp: Date = Date()
}
