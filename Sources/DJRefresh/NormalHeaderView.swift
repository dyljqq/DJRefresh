//
//  NormalHeaderView.swift
//  
//
//  Created by jiqinqiang on 2022/10/25.
//

import UIKit

class NormalHeaderView: RefreshPositionView {
  
  init(with style: RefreshViewStyle = .normal, height: CGFloat = 60, action: @escaping () -> ()) {
    super.init(refreshPosition: .header, style: style, height: height, action: action)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
