//
//  CustomViewStyle.swift
//  UIViewStyling
//
//  Created by Matheus on 26/02/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import Foundation
import UIKit

struct CustomViewStyle<T> {
    let style: (T) -> Void
}

extension CustomViewStyle {
    func compose(with style: ViewStyle<T>) -> ViewStyle<T> {
        return ViewStyle<T> {
            style.style($0)
            self.style($0)
        }
    }
}

extension CustomViewStyle where T: UIButton {
    static var filled: ViewStyle<UIButton> {
        return ViewStyle<UIButton> {
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .red
        }
    }
    
    static var rounded: ViewStyle<UIButton> {
        return ViewStyle<UIButton> {
            $0.layer.cornerRadius = 8
        }
    }
    
    static var roundedAndFilled: ViewStyle<UIButton> {
        return filled.compose(with: rounded)
    }
}
