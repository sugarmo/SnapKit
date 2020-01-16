//
//  SnapKit
//
//  Copyright (c) 2011-Present SnapKit Team - https://github.com/SnapKit
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public protocol ConstraintDSL {
    var target: AnyObject? { get }

    func setLabel(_ value: String?)
    func label() -> String?
}

extension ConstraintDSL {
    public func setLabel(_ value: String?) {
        objc_setAssociatedObject(target as Any, &labelKey, value, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }

    public func label() -> String? {
        return objc_getAssociatedObject(target as Any, &labelKey) as? String
    }
}

private var labelKey: UInt8 = 0

public protocol ConstraintBasicAttributesDSL: ConstraintDSL {
}

extension ConstraintBasicAttributesDSL {
    // MARK: Basics

    public var left: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.left)
    }

    public var top: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.top)
    }

    public var right: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.right)
    }

    public var bottom: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.bottom)
    }

    public var leading: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.leading)
    }

    public var trailing: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.trailing)
    }

    public var width: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.width)
    }

    public var height: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.height)
    }

    public var centerX: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.centerX)
    }

    public var centerY: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.centerY)
    }

    public var edges: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.edges)
    }

    public var directionalEdges: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.directionalEdges)
    }

    public var horizontalEdges: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.horizontalEdges)
    }

    public var verticalEdges: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.verticalEdges)
    }

    public var directionalHorizontalEdges: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.directionalHorizontalEdges)
    }

    public var directionalVerticalEdges: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.directionalVerticalEdges)
    }

    public var size: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.size)
    }

    public var center: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.center)
    }
}

public protocol ConstraintAttributesDSL: ConstraintBasicAttributesDSL {
}

extension ConstraintAttributesDSL {
    // MARK: Baselines

    @available(iOS 8.0, OSX 10.11, *)
    public var lastBaseline: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.lastBaseline)
    }

    @available(iOS 8.0, OSX 10.11, *)
    public var firstBaseline: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.firstBaseline)
    }

    // MARK: Margins

    @available(iOS 8.0, *)
    public var leftMargin: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.leftMargin)
    }

    @available(iOS 8.0, *)
    public var topMargin: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.topMargin)
    }

    @available(iOS 8.0, *)
    public var rightMargin: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.rightMargin)
    }

    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.bottomMargin)
    }

    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.leadingMargin)
    }

    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.trailingMargin)
    }

    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.centerXWithinMargins)
    }

    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.centerYWithinMargins)
    }

    @available(iOS 8.0, *)
    public var margins: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.margins)
    }

    @available(iOS 8.0, *)
    public var directionalMargins: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.directionalMargins)
    }

    @available(iOS 8.0, *)
    public var centerWithinMargins: ConstraintItem {
        return ConstraintItem(target: target, attributes: ConstraintAttributes.centerWithinMargins)
    }
}

extension ConstraintAttributesDSL {
    // MARK: Mapping

    func item(for attribute: NSLayoutConstraint.Attribute) -> ConstraintItem {
        switch attribute {
        case .left:
            return left
        case .right:
            return right
        case .top:
            return top
        case .bottom:
            return bottom
        case .leading:
            return leading
        case .trailing:
            return trailing
        case .width:
            return width
        case .height:
            return height
        case .centerX:
            return centerX
        case .centerY:
            return centerY
        case .lastBaseline:
            return lastBaseline
        case .firstBaseline:
            return firstBaseline
        case .leftMargin:
            return leftMargin
        case .rightMargin:
            return rightMargin
        case .topMargin:
            return topMargin
        case .bottomMargin:
            return bottomMargin
        case .leadingMargin:
            return leadingMargin
        case .trailingMargin:
            return trailingMargin
        case .centerXWithinMargins:
            return centerXWithinMargins
        case .centerYWithinMargins:
            return centerYWithinMargins
        default:
            fatalError("Wrong layout attribute.")
        }
    }
}
