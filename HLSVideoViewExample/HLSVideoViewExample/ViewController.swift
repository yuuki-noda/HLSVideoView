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
    private let controlButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.setImage(UIImage(systemName: "stop.fill"), for: .selected)
        button.layer.cornerRadius = 4
        button.tintColor = .systemBlue
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 1
        button.isSelected = false
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(hlsVideoView)
        view.addSubview(controlButton)
        controlButton.addTarget(self, action: #selector(didTapControlButton(_:)), for: .touchUpInside)
        hlsVideoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hlsVideoView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0),
            hlsVideoView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16.0),
            hlsVideoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hlsVideoView.heightAnchor.constraint(equalTo: hlsVideoView.widthAnchor, multiplier: 9.0/16.0),
            controlButton.centerXAnchor.constraint(equalTo: hlsVideoView.centerXAnchor),
            controlButton.topAnchor.constraint(equalTo: hlsVideoView.bottomAnchor, constant: 16.0),
            controlButton.widthAnchor.constraint(equalToConstant: 88.0),
            controlButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8") else {
            return
        }
        Task {
            if await hlsVideoView.load(url: url) {
                controlButton.isEnabled = true
            } else {
                controlButton.isEnabled = false
            }
        }
    }
    
    @objc private func didTapControlButton(_ sender: UIButton) {
        if controlButton.isSelected {
            hlsVideoView.stop()
        } else {
            hlsVideoView.play()
        }
        controlButton.isSelected.toggle()
    }
}
