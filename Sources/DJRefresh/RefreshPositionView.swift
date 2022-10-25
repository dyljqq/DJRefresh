//
//  RefreshPositionView.swift
//  
//
//  Created by jiqinqiang on 2022/10/25.
//

import UIKit

class RefreshPositionView: RefreshView {

  let style: RefreshViewStyle
  
  lazy var refreshingView: UIView = {
    return self.refreshingView(with: style) ?? UIView()
  }()
  
  init(refreshPosition: RefreshPosition, style: RefreshViewStyle = .normal, height: CGFloat = 60, action: @escaping () -> ()) {
    self.style = style
    super.init(refreshPosition: refreshPosition, height: height, action: action)
    setUp()
  }
  
  private func setUp() {
    layer.addSublayer(self.arrowLayer)
    addSubview(self.refreshingView)
    
    self.arrowLayer.isHidden = true
    self.refreshingView.isHidden = true
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    let center = CGPoint(x: bounds.midX, y: bounds.midY)
    self.arrowLayer.position = center
    self.refreshingView.frame = bounds
    self.refreshingView.center = center
  }
  
  override func didUpdateState(_ isRefreshing: Bool) {
    arrowLayer.isHidden = true
    if isRefreshing {
      self.startAnimation(with: style)
    } else {
      self.stopAnimation(with: style)
    }
  }
  
  override func didUpdateProgress(_ progress: CGFloat) {
    arrowLayer.isHidden = false
    let rotation = CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1)
    switch self.refreshPosition {
    case .header: arrowLayer.transform = progress == 1 ? rotation : CATransform3DIdentity
    case .footer: arrowLayer.transform = progress == 1 ? CATransform3DIdentity : rotation
    }
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
