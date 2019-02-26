//
//  CustomStylable.swift
//  UIViewStyling
//
//  Created by Matheus on 26/02/19.
//  Copyright © 2019 Matheus. All rights reserved.
//

import Foundation
import UIKit

protocol CustomStylable {
    init()
}

extension UIView: CustomStylable {}

extension CustomStylable {
    
    init(style: CustomViewStyle<Self>) {
        self.init()
        self.apply(style)
    }
    
    func apply(_ style: CustomViewStyle<Self>) {
        style.style(self)
    }
}
