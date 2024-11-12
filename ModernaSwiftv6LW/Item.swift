//
//  Item.swift
//  ModernaSwiftv6LW
//
//  Created by L W on 2024-11-12.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    var id: UUID
    var title: String
    var isCompleted: Bool = false
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
