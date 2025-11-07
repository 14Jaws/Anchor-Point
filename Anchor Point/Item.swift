//
//  Item.swift
//  Anchor Point
//
//  Created by Trudy's Computer on 11/7/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
