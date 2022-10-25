//
//  File.swift
//  
//
//  Created by jiqinqiang on 2022/10/25.
//

import UIKit

private var arrowKey: UInt = 0

extension UIView {
  
  var arrowLayer: CAShapeLayer {
    return (objc_getAssociatedObject(self, &arrowKey) as? CAShapeLayer) ?? getArrowLayer()
  }
  
  private func getArrowLayer() -> CAShapeLayer {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 0, y: 8))
    path.addLine(to: CGPoint(x: 0, y: -8))
    path.move(to: CGPoint(x: 0, y: 8))
    path.addLine(to: CGPoint(x: 5.66, y: 2.34))
    path.move(to: CGPoint(x: 0, y: 8))
    path.addLine(to: CGPoint(x: -5.66, y: 2.34))
    
    let layer = CAShapeLayer()
    layer.path = path.cgPath
    layer.strokeColor = UIColor.black.withAlphaComponent(0.8).cgColor
    layer.lineWidth = 2
    layer.lineCap = .round
    
    objc_setAssociatedObject(self, &arrowKey, layer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    
    return layer
  }
  
}
