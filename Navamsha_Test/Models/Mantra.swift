//
//  MantrasModel.swift
//  Navamsha_Test
//
//  Created by Nick Ivanov on 01.02.2024.
//

import Foundation

struct Mantra {
    let name: String
    let duration: Int
    
    init?(dict: [String: Any]) {
        guard let name = dict["name"] as? String,
              let duration = dict["duration"] as? Int else {
            return nil
        }
        self.name = name
        self.duration = duration
    }
}
