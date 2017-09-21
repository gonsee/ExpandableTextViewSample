//
//  ExpandableTextView.swift
//  ExpandableTextViewSample
//
//  Created by Shingo Sato on 2017/09/21.
//  Copyright © 2017年 JUBILEE WORKS, Inc. All rights reserved.
//

import UIKit

class ExpandableTextView: UIView {

    struct K {
        static let headerHeight: CGFloat = 50
    }

    @IBOutlet weak var textView: UITextView!

    var isExpanded: Bool = false {
        didSet {
            updateSize(animated: true)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // 他の制約によって intrinsicContentSize よりも小さく潰されるのを防ぐ
        setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .vertical)
    }

    override var intrinsicContentSize: CGSize {
        if isExpanded {
            let height = ceil(K.headerHeight + textView.intrinsicContentSize.height)
            return CGSize(width: UIViewNoIntrinsicMetric, height: height)
        } else {
            return CGSize(width: UIViewNoIntrinsicMetric, height: K.headerHeight)
        }
    }

    func configure(withText text: String) {
        textView.text = text
        updateSize(animated: false)
    }

    private func updateSize(animated: Bool) {
        invalidateIntrinsicContentSize()
        superview?.setNeedsLayout()
        if animated {
            UIView.animate(withDuration: 0.3) {
                self.superview?.layoutIfNeeded()
            }
        } else {
            superview?.layoutIfNeeded()
        }
    }

    @IBAction func buttonTapped(_ sender: Any) {
        isExpanded = !isExpanded
    }

}
