//
//  ViewController.swift
//  HLSVideoViewExample
//
//  Created by yuki noda on 2023/11/07.
//

import UIKit
import HLSVideoView

final class ViewController: UIViewController {

    private let hlsVideoView = HLSVideoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(hlsVideoView)
        NSLayoutConstraint.activate([
            hlsVideoView.leftAnchor.constraint(equalTo: view.leftAnchor),
            hlsVideoView.rightAnchor.constraint(equalTo: view.rightAnchor),
            hlsVideoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hlsVideoView.heightAnchor.constraint(equalTo: hlsVideoView.widthAnchor, multiplier: 9.0/16.0)
        ])
    }
}
