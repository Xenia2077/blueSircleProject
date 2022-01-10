//
//  BlueCircleView.swift
//  CustomUIViewGame
//
//  Created by Ксения Борисова on 10.01.2022.
//

import UIKit

@IBDesignable
class BlueCircleView: UIView {
    

    @IBInspectable var roundView: Bool = false {
        didSet {
            if roundView {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundView {
            layer.cornerRadius = frame.height / 2
        }
    }

}
