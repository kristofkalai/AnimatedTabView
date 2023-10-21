//
//  Tab.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 23..
//

public struct Tab {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Tab: Identifiable {
    public var id: String {
        rawValue
    }
}

extension Tab: Equatable {}
