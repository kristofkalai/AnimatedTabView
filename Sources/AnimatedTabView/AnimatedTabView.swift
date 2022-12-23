//
//  AnimatedTabView.swift
//
//
//  Created by Kristof Kalai on 2022. 12. 23..
//

import SwiftUI

public struct AnimatedTabView {
    @Binding private var selectedTab: Tab
    private let tabs: [Tab]
    private let padding: EdgeInsets
    private let backgroundColor: (Tab) -> Color
    private let foregroundColor: (Tab) -> Color
    
    public init(selectedTab: Binding<Tab>,
                tabs: [Tab],
                padding: EdgeInsets = .init(top: 4, leading: 8, bottom: 4, trailing: 8),
                backgroundColor: @escaping (Tab) -> Color = { _ in .white },
                foregroundColor: @escaping (Tab) -> Color = { _ in .black }) {
        self._selectedTab = selectedTab
        self.tabs = tabs
        self.padding = padding
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
}

extension AnimatedTabView: View {
    public var body: some View {
        getTabs()
            .padding(padding)
            .background(
                GeometryReader {
                    backgroundColor(selectedTab)
                        .clipShape(TabShape(tabPoint: curvePoint(width: $0.size.width)))
                }
            )
            .clipShape(Capsule())
            .padding()
    }
}

extension AnimatedTabView {
    private func getTabs() -> some View {
        HStack(spacing: 0) {
            ForEach(tabs) {
                TabBarButton(selectedTab: $selectedTab, tab: $0, foregroundColor: foregroundColor)
            }
        }
    }
    
    private func curvePoint(width: CGFloat) -> CGFloat {
        curvePoint(forIndex: tabs.firstIndex(of: selectedTab) ?? .zero, width: width)
    }
    
    private func curvePoint(forIndex index: Int, width: CGFloat) -> CGFloat {
        let width = width - padding.trailing - padding.leading
        let pieces = CGFloat(tabs.count) * 2
        return width / pieces * (CGFloat(index) * 2 + 1) + padding.leading
    }
}

struct AnimatedTabView_Previews: PreviewProvider {
    @State private static var selectedTab: Tab = .init(rawValue: "house")
    
    static var previews: some View {
        AnimatedTabView(selectedTab: $selectedTab,
                        tabs: [.init(rawValue: "house"), .init(rawValue: "message")],
                        backgroundColor: { _ in .purple })
    }
}

