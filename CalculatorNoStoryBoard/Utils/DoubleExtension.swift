//
//  DoubleExtension.swift
//  CalculatorNoStoryBoard
//
//  Created by Burak Gül on 10.02.2024.
//

import Foundation


extension Double {
    var isInt : Bool {
        var intData = Int(self)
        return Double(intData) == self
    }
    
}
