//
//  Nib.swift
//  iMusic
//
//  Created by nik on 02.02.2024.
//

import UIKit

extension UIView {
    class func loadFromNib<T: UIView>() -> T {
        Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
