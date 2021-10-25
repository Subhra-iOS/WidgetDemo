//
//  SharedContent.swift
//  WidgetDemo
//
//  Created by Subhra Roy on 25/10/21.
//

import SwiftUI

struct Shared {
    static var backgroundGradient: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
