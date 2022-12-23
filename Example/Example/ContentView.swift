//
//  ContentView.swift
//  Example
//
//  Created by Kristof Kalai on 2022. 12. 23..
//

import AnimatedTabView
import SwiftUI

extension Tab {
    static var house: Self {
        .init(rawValue: "house")
    }
    static var bookmark: Self {
        .init(rawValue: "bookmark")
    }
    static var message: Self {
        .init(rawValue: "message")
    }
    static var person: Self {
        .init(rawValue: "person")
    }
}

struct ContentView {
    @State private var selectedTab: Tab = .house
}

extension ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            foregroundColor

            VStack(spacing: .zero) {
                ZStack {
                    Color.white
                        .opacity(0.66)
                    Text(selectedTab.rawValue)
                        .foregroundColor(foregroundColor)
                }
                AnimatedTabView(
                    selectedTab: $selectedTab,
                    tabs: [.house, .bookmark, .message, .person],
                    backgroundColor: { _ in .white },
                    foregroundColor: { _ in foregroundColor }
                )
            }
        }
        .ignoresSafeArea()
    }
}

extension ContentView {
    private var foregroundColor: Color {
        switch selectedTab {
        case .house: return .purple
        case .bookmark: return .red
        case .message: return .black
        case .person: return .green
        default: fatalError()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
