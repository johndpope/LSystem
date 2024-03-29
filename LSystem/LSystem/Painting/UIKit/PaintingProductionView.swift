//
//  PaintingProductionView.swift
//  Example-iOS
//
//  Created by Hanssen, Alfie on 4/7/16.
//  Copyright © 2016 Alfie Hanssen. All rights reserved.
//

import UIKit
import CoreGraphics

public class PaintingProductionView: UIView
{
    public var symbols: [DrawableSymbol]?
    {
        didSet
        {
            self.setNeedsDisplay()
        }
    }
    
    public override func drawRect(rect: CGRect)
    {
        guard let symbols = self.symbols else
        {
            return
        }
                
        for symbol in symbols
        {
            let path = symbol.bezierPath
            
            let radians = symbol.rotation.radians()
            let transform = CGAffineTransformMakeRotation(radians);
            path.applyTransform(transform)

            if let fillColor = symbol.fillColor
            {
                fillColor.setFill()
                path.fillWithBlendMode(symbol.blendMode, alpha: symbol.alpha)
            }
            
            if let strokeColor = symbol.strokeColor
            {
                strokeColor.setStroke()
                path.strokeWithBlendMode(symbol.blendMode, alpha: symbol.alpha)
            }
        }
    }
}
