//
//  ViewController.swift
//  ExpandableTextViewSample
//
//  Created by Shingo Sato on 2017/09/21.
//  Copyright © 2017年 JUBILEE WORKS, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "ExpandableTextView", bundle: nil)
        if let expandableView = nib.instantiate(withOwner: nil, options: nil).first as? ExpandableTextView {
            view.addSubview(expandableView)
            expandableView.translatesAutoresizingMaskIntoConstraints = false

            // expandableView　と view の制約
            // 高さ方向は intrinsicContentSize で決まるので制約はいらない
            expandableView.leadingAnchor
                .constraint(equalTo: view.leadingAnchor)
                .isActive = true
            expandableView.trailingAnchor
                .constraint(equalTo: view.trailingAnchor)
                .isActive = true
            expandableView.bottomAnchor
                .constraint(equalTo: view.bottomAnchor)
                .isActive = true

            // expandableView　が scrollView に被らないようにする制約
            // view と scrollView の bottom は優先度を低くしてあるので
            // expandableView が存在すればこちらが優先される
            expandableView.topAnchor
                .constraint(equalTo: scrollView.bottomAnchor)
                .isActive = true

            expandableView.configure(withText: "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ")
        }

    }

}

