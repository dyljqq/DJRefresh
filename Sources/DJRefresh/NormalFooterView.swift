//
//  NormalFooterView.swift
//  
//
//  Created by jiqinqiang on 2022/10/25.
//

import UIKit

class NormalFooterView: RefreshPositionView {
  init(with style: RefreshViewStyle = .normal, height: CGFloat = 60, action: @escaping () -> ()) {
    super.init(refreshPosition: .footer, style: style, height: height, action: action)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
