//
//  GameView.swift
//  CodificandoClient
//
//  Created by Juan Ochoa on 6/15/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import UIKit

class GameView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        let border = UIBezierPath(rect: self.bounds)
        UIColor.black.setStroke()
        border.stroke()

        let player = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: CGFloat(5.0), startAngle: CGFloat(0), endAngle: 2*CGFloat.pi, clockwise: true)

        UIColor.black.setStroke()
        UIColor.green.setFill()
        player.lineWidth = 2.0

        player.fill()
        player.stroke()
    }
}
