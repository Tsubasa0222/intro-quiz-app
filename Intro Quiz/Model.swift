//
//  Model.swift
//  Intro Quiz
//
//  Created by 原田翼 on 2025/10/31.
//

import SwiftUI
import Foundation

struct Music: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let filename: String
}
