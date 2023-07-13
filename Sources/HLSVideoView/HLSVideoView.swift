import UIKit

public class HLSVideoView: UIView {
    public let thumbnailImageView = UIImageView()
    public let videoView = UIView()

    public init() {
        super.init(frame: .zero)
        addSubview(thumbnailImageView)
        addSubview(videoView)
        let thumbnailLeft = thumbnailImageView.leftAnchor.constraint(equalTo: leftAnchor)
        NSLayoutConstraint.activate([
            thumbnailLeft,
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
