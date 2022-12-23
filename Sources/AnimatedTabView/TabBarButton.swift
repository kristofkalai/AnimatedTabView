//
//  TabBarButton.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 23..
//

import SwiftUI

struct TabBarButton {
    @Binding private var selectedTab: Tab
    private let tab: Tab
    private let foregroundColor: (Tab) -> Color
    private let animation: Animation

    init(selectedTab: Binding<Tab>,
         tab: Tab,
         foregroundColor: @escaping (Tab) -> Color,
         animation: Animation = .interactiveSpring(response: 0.66, dampingFraction: 0.33, blendDuration: 0.5)) {
        self._selectedTab = selectedTab
        self.tab = tab
        self.foregroundColor = foregroundColor
        self.animation = animation
    }
}

extension TabBarButton: View {
    var body: some View {
        VStack(spacing: 4) {
            Button(action: action, label: label)
            Text(tab.rawValue)
                .foregroundColor(foregroundColor(selectedTab))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 76)
        .padding(.vertical, 4)
        .contentShape(Rectangle())
        .offset(y: selectedTab == tab ? -16 : 0)
        .animation(animation, value: selectedTab)
    }
}

extension TabBarButton {
    private func action() {
        withAnimation(animation) {
            selectedTab = tab
        }
    }

    private func label() -> some View {
        Image(systemName: "\(tab.rawValue)\(selectedTab == tab ? ".fill" : .init())")
            .transition(.identity)
            .font(.title.bold())
            .foregroundColor(foregroundColor(selectedTab))
            .drawingGroup()
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(selectedTab: .constant(.init(rawValue: "message")),
                     tab: .init(rawValue: "message"),
                     foregroundColor: { _ in .black })
    }
}
