//
//  UIView+LayoutAnchorExtension.swif
//
//  Created by sy-hash on 2018/02/14.
//  Copyright © 2018年 sy-hash. All rights reserved.
//

import UIKit

protocol AutolayoutCompatible {
    associatedtype AutolayoutCompatibleType
    var anchor: AutolayoutConstraintView<AutolayoutCompatibleType> { get }
}

final class AutolayoutConstraintView<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

extension AutolayoutCompatible {
    var anchor: AutolayoutConstraintView<Self> {
        return AutolayoutConstraintView(self)
    }
}

extension UIView: AutolayoutCompatible {}

final class AutolayoutConstraintViewEdge {
    let base: UIView
    init(_ base: UIView) {
        self.base = base
    }
}

extension AutolayoutConstraintViewEdge {
    
    @discardableResult func equalToSuperview(insets: UIEdgeInsets = UIEdgeInsets.zero) -> AutolayoutConstraintView<UIView>  {
        guard let superview = base.superview else { fatalError() }
        base.translatesAutoresizingMaskIntoConstraints = false
        base.topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        base.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left).isActive = true
        base.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom).isActive = true
        base.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insets.right).isActive = true
        return AutolayoutConstraintView(base)
    }
    
}

enum AutolayoutAnchor {
    // for NSLayoutYAxisAnchor
    case top
    case bottom
    case centerY
    // for NSLayoutXAxisAnchor
    case left
    case right
    case centerX
}

enum AutolayoutAnchorDimentionType {
    case width
    case height
}

final class AutolayoutConstraintViewAxis {
    fileprivate let base: UIView
    fileprivate let direction: AutolayoutAnchor
    public init(_ base: UIView, direction: AutolayoutAnchor) {
        self.base = base
        self.direction = direction
    }
}

extension AutolayoutConstraintViewAxis {
    
    @discardableResult func constraintEqualTo(_ anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> AutolayoutConstraintView<UIView> {
        base.translatesAutoresizingMaskIntoConstraints = false
        switch direction {
        case .left:
            base.leftAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        case .right:
            base.rightAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        case .centerX:
            base.centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        default:
            fatalError()
        }
        return AutolayoutConstraintView(self.base)
    }
    
    @discardableResult func constraintEqualTo(_ anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> AutolayoutConstraintView<UIView> {
        base.translatesAutoresizingMaskIntoConstraints = false
        switch direction {
        case .top:
            base.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        case .bottom:
            base.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        case .centerY:
            base.centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        default:
            fatalError()
        }
        return AutolayoutConstraintView(self.base)
    }
    
    @discardableResult func constraintEqualToSuperview(constant: CGFloat = 0) -> AutolayoutConstraintView<UIView> {
        guard let superview = base.superview else { fatalError() }
        base.translatesAutoresizingMaskIntoConstraints = false
        switch direction {
        case .left:
            base.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
        case .right:
            base.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: constant).isActive = true
        case .centerX:
            base.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: constant).isActive = true
        case .top:
            base.topAnchor.constraint(equalTo: superview.firstBaselineAnchor, constant: constant).isActive = true
        case .bottom:
            base.bottomAnchor.constraint(equalTo: superview.lastBaselineAnchor, constant: constant).isActive = true
        case .centerY:
            base.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: constant).isActive = true
        }
        return AutolayoutConstraintView(self.base)
    }
    
}

final class AutolayoutConstraintViewDimension {
    fileprivate let base: UIView
    fileprivate let dementionType: AutolayoutAnchorDimentionType
    public init(_ base: UIView, dementionType: AutolayoutAnchorDimentionType) {
        self.base = base
        self.dementionType = dementionType
    }
}

extension AutolayoutConstraintViewDimension {
    
    @discardableResult func constraint(constant: CGFloat) -> AutolayoutConstraintView<UIView> {
        base.translatesAutoresizingMaskIntoConstraints = false
        switch dementionType {
        case .width:
            base.widthAnchor.constraint(equalToConstant: constant).isActive = true
        case .height:
            base.heightAnchor.constraint(equalToConstant: constant).isActive = true
        }
        return AutolayoutConstraintView(self.base)
    }
    
    @discardableResult func constraintEqualToSuperview(constant: CGFloat = 0.0) -> AutolayoutConstraintView<UIView> {
        base.translatesAutoresizingMaskIntoConstraints = false
        guard let superview = base.superview else { fatalError() }
        switch dementionType {
        case .width:
            base.widthAnchor.constraint(equalTo: superview.widthAnchor, constant: constant).isActive = true
        case .height:
            base.heightAnchor.constraint(equalTo: superview.heightAnchor, constant: constant).isActive = true
        }
        return AutolayoutConstraintView(self.base)
    }
    
    @discardableResult func constraint(equalTo: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> AutolayoutConstraintView<UIView> {
        base.translatesAutoresizingMaskIntoConstraints = false
        switch dementionType {
        case .width:
            base.widthAnchor.constraint(equalTo: equalTo, multiplier: multiplier, constant: constant).isActive = true
        case .height:
            base.heightAnchor.constraint(equalTo: equalTo, multiplier: multiplier, constant: constant).isActive = true
        }
        return AutolayoutConstraintView(self.base)
    }
    
}

final class AutolayoutConstraintViewSizeDimension {
    fileprivate let base: UIView
    public init(_ base: UIView) {
        self.base = base
    }
}

extension AutolayoutConstraintViewSizeDimension {
    @discardableResult func constraintEqual(equalTo: CGSize) -> AutolayoutConstraintView<UIView> {
        base.translatesAutoresizingMaskIntoConstraints = false
        base.heightAnchor.constraint(equalToConstant: equalTo.height).isActive = true
        base.widthAnchor.constraint(equalToConstant: equalTo.width).isActive = true
        return AutolayoutConstraintView(self.base)
    }
}

extension AutolayoutConstraintView where Base: UIView {
    
    private var baseSuperview: UIView {
        return base.superview!
    }
    
    var edge: AutolayoutConstraintViewEdge {
        return AutolayoutConstraintViewEdge(self.base)
    }
    
    var top: AutolayoutConstraintViewAxis {
        return AutolayoutConstraintViewAxis(self.base, direction: .top)
    }
    
    var bottom: AutolayoutConstraintViewAxis {
        return AutolayoutConstraintViewAxis(self.base, direction: .bottom)
    }
    
    var centerY: AutolayoutConstraintViewAxis {
        return AutolayoutConstraintViewAxis(self.base, direction: .centerY)
    }
    
    var right: AutolayoutConstraintViewAxis {
        return AutolayoutConstraintViewAxis(self.base, direction: .right)
    }
    
    var left: AutolayoutConstraintViewAxis {
        return AutolayoutConstraintViewAxis(self.base, direction: .left)
    }
    
    var centerX: AutolayoutConstraintViewAxis {
        return AutolayoutConstraintViewAxis(self.base, direction: .centerX)
    }
    
    var width: AutolayoutConstraintViewDimension {
        return AutolayoutConstraintViewDimension(self.base, dementionType: .width)
    }
    
    var height: AutolayoutConstraintViewDimension {
        return AutolayoutConstraintViewDimension(self.base, dementionType: .height)
    }
    
    var size: AutolayoutConstraintViewSizeDimension {
        return AutolayoutConstraintViewSizeDimension(self.base)
    }
    
}
