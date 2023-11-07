import UIKit

public protocol HLSVideoViewDelegate: AnyObject {
    func didLoadHLSVideo()
}

public class HLSVideoView: UIView {
    public init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func play(urlString: String) async -> Bool {
        guard let url = URL(string: urlString) else {
            return false
        }
        
        return true
    }
}
