//
//  UIView+Extension.swift
//  Weedy
//
//  Created by MAC on 15/08/20.
//  Copyright © 2020 Salace. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /// For rounding the corners of the view
    func roundCorners(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
