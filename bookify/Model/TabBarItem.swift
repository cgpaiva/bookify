//
//  TabBarItem.swift
//  bookify
//
//  Created by Gabriel on 30/06/23.
//

import Foundation
import TabBar


enum TabBarItem: Int, Tabbable {
    case first = 0
    case second
    case third
    
    var icon: String {
        switch self {
            case .first: return "house"
            case .second: return "magnifyingglass"
            case .third: return "person"
        }
    }
    
    var title: String {
        switch self {
            case .first: return "First"
            case .second: return "Second"
            case .third: return "Third"
        }
    }
}
