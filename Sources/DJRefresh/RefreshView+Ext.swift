//
//  File.swift
//  
//
//  Created by jiqinqiang on 2022/10/25.
//

import UIKit

private var activityIndicatorViewKey: UInt8 = 0
private var cookieViewKey: UInt8 = 0

extension RefreshView {
  private var activityIndicatorView: UIActivityIndicatorView? {
    return objc_getAssociatedObject(self, &activityIndicatorViewKey) as? UIActivityIndicatorView
  }
  
  private var cookieView: IndicatorCookieTerminatorView? {
    return objc_getAssociatedObject(self, &cookieViewKey) as? IndicatorCookieTerminatorView
  }
  
  func refreshingView(with style: RefreshViewStyle) -> UIView? {
    switch style {
    case .normal:
      if activityIndicatorView == nil {
        objc_setAssociatedObject(
          self,
          &activityIndicatorViewKey,
          UIActivityIndicatorView(style: .medium),
          .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
      }
      return activityIndicatorView
    case .cookie:
      if cookieView == nil {
        objc_setAssociatedObject(
          self,
          &cookieViewKey,
          IndicatorCookieTerminatorView(tintColor: .black),
          .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
      }
      return cookieView
    }
  }
  
  func startAnimation(with style: RefreshViewStyle) {
    switch style {
    case .normal:
      if let activityIndicatorView = activityIndicatorView {
        activityIndicatorView.startAnimating()
      }
    case .cookie:
      if let cookieView = cookieView {
        cookieView.startAnimation()
      }
    }
  }
  
  func stopAnimation(with style: RefreshViewStyle) {
    switch style {
    case .normal:
      if let activityIndicatorView = activityIndicatorView {
        activityIndicatorView.stopAnimating()
      }
    case .cookie:
      if let cookieView = cookieView {
        cookieView.stopAnimation()
      }
    }
  }
}
