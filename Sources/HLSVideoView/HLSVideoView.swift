import AVFoundation
import UIKit

public class HLSVideoView: UIView {
    public override static var layerClass: AnyClass { AVPlayerLayer.self }

    public func load(url: URL, isLoop: Bool = true) async -> Bool {
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVQueuePlayer(playerItem: playerItem)
        player.volume = 0.0
        playerLayer.player = player
        if (isLoop) {
            looper = AVPlayerLooper(player: player, templateItem: playerItem)
        }
        return await withCheckedContinuation { continuation in
            observers = player.observe(\.status, options: .new, changeHandler: { player, _ in
                switch player.status {
                case .readyToPlay:
                    continuation.resume(returning: true)
                default:
                    continuation.resume(returning: false)
                }
            })
        }
    }

    public func play() {
        player.play()
    }
    
    public func stop() {
        player.pause()
    }
    
    // MARK: Private

    private var looper: AVPlayerLooper?

    private var player: AVQueuePlayer!

    private var observers: NSKeyValueObservation?

    private var playerLayer: AVPlayerLayer { layer as! AVPlayerLayer }
}
