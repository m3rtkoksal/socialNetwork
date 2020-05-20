//
//  FancyButton.swift
//  socialNetwork
//
//  Created by Mert Köksal on 18.05.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit

class FancyButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(displayP3Red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 4
    }


}
