//
//  TabShape.swift
//  
//
//  Created by Kristof Kalai on 2022. 12. 23..
//

import SwiftUI

struct TabShape {
    private(set) var tabPoint: CGFloat
}

extension TabShape: Shape {
    var animatableData: CGFloat {
        get {
            tabPoint
        }
        set {
            tabPoint = newValue
        }
    }

    func path(in rect: CGRect) -> Path {
        let curveWidth = rect.width / 3
        let curveHeight = rect.height / 3
        return .init {
            $0.move(to: .init(x: rect.maxX, y: rect.maxY))
            $0.addLine(to: .init(x: rect.maxX, y: rect.minY))
            $0.addLine(to: .init(x: rect.minX, y: rect.minY))
            $0.addLine(to: .init(x: rect.minX, y: rect.maxY))
            let mid = tabPoint
            $0.move(to: .init(x: mid - curveWidth / 2, y: rect.maxY))
            $0.addCurve(to: .init(x: mid, y: rect.maxY - curveHeight),
                        control1: .init(x: mid - curveWidth / 4.5, y: rect.maxY),
                        control2: .init(x: mid - curveWidth / 4.5, y: rect.maxY - curveHeight))
            $0.addCurve(to: .init(x: mid + curveWidth / 2, y: rect.maxY),
                        control1: .init(x: mid + curveWidth / 4.5, y: rect.maxY - curveHeight),
                        control2: .init(x: mid + curveWidth / 4.5, y: rect.maxY))
        }
    }
}

struct TabShape_Previews: PreviewProvider {
    private static let size: CGSize = .init(width: 200, height: 50)

    static var previews: some View {
        Color.red
            .frame(width: size.width, height: size.height)
            .clipShape(TabShape(tabPoint: size.width / 2))
            .clipShape(Capsule())
    }
}
