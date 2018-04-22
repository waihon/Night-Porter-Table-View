//
//  Task.swift
//  Night Porter Table View
//
//  Created by Waihon Yew on 21/04/2018.
//  Copyright © 2018 Pringgle Media. All rights reserved.
//

import Foundation

enum TaskType {
    case daily, weekly, monthly
}

struct Task {
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}
