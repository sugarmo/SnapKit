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

public class LayoutConstraint: NSLayoutConstraint {
    public var label: String? {
        get {
            return identifier
        }
        set {
            identifier = newValue
        }
    }

    internal weak var constraint: Constraint?

    override public var description: String {
        var description = "<"

        description += descriptionForObject(self)

        if let firstItem = self.firstItem {
            description += " \(descriptionForObject(firstItem))"
        }

        if firstAttribute != .notAnAttribute {
            description += ".\(descriptionForAttribute(firstAttribute))"
        }

        description += " \(descriptionForRelation(relation))"

        if let secondItem = self.secondItem {
            description += " \(descriptionForObject(secondItem))"
        }

        if secondAttribute != .notAnAttribute {
            description += ".\(descriptionForAttribute(secondAttribute))"
        }

        if multiplier != 1.0 {
            description += " * \(multiplier)"
        }

        if secondAttribute == .notAnAttribute {
            description += " \(constant)"
        } else {
            if constant > 0.0 {
                description += " + \(constant)"
            } else if constant < 0.0 {
                description += " - \(abs(constant))"
            }
        }

        if priority.rawValue != 1000.0 {
            description += " ^\(priority)"
        }

        description += ">"

        return description
    }
}

internal func == (lhs: LayoutConstraint, rhs: LayoutConstraint) -> Bool {
    // If firstItem or secondItem on either constraint has a dangling pointer
    // this comparison can cause a crash. The solution for this is to ensure
    // your layout code hold strong references to things like Views, LayoutGuides
    // and LayoutAnchors as SnapKit will not keep strong references to any of these.
    guard lhs.firstAttribute == rhs.firstAttribute &&
        lhs.secondAttribute == rhs.secondAttribute &&
        lhs.relation == rhs.relation &&
        lhs.priority == rhs.priority &&
        lhs.multiplier == rhs.multiplier &&
        lhs.secondItem === rhs.secondItem &&
        lhs.firstItem === rhs.firstItem else {
        return false
    }
    return true
}
