//
//  PlistManager.swift
//  Navamsha_Test
//
//  Created by Nick Ivanov on 01.02.2024.
//

import Foundation

struct PlistManager {
    static func getMantras() -> [Mantra]? {
        guard let path = Bundle.main.path(forResource: "Mantras", ofType: "plist"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let plistData = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String: Any]] else {
            return nil
        }
        return plistData.compactMap { Mantra(dict: $0) }
    }
}
