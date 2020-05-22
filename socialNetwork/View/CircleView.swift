//
//  CircleView.swift
//  socialNetwork
//
//  Created by Mert Köksal on 21.05.2020.
//  Copyright © 2020 Mert Köksal. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }

}
