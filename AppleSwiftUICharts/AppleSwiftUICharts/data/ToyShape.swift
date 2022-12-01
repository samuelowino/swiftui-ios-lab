//
//  ToyShape.swift
//  AppleSwiftUICharts
//
//  Created by Samuel Owino on 01/12/2022.
//

import Foundation

struct ToyShape: Identifiable {
    var id = UUID()
    var type: String
    var count: Double
}

var data: [ToyShape] = [
    ToyShape(type: "Cube", count: 5),
    ToyShape(type: "Sphere", count: 3),
    ToyShape(type: "Triangle", count: 4),
    ToyShape(type: "Rectangle", count: 7),
]
