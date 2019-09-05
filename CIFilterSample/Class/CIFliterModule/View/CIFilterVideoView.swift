//
//  CIFilterVideoView.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/4.
//  Copyright © 2019 Boris. All rights reserved.
//

import UIKit
import AVFoundation

class CIFilterVideoView: UIView {

    let playUrl:String = "http://img.ksbbs.com/asset/Mon_1703/d30e02a5626c066.mp4"
    var player:AVPlayer = AVPlayer.init()
    var playView:UIView = UIView.init()
    var isPlaying:Bool = false
    var playItem:AVPlayerItem?
    var segment:UISegmentedControl?
    var playRate:CGFloat = 1

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        self.backgroundColor = .white
        NotificationCenter.default.addObserver(self, selector: #selector(playFinished), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)

        showFilterVideoSubs()
    }
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        
        self.player.pause()
    }
    
    func showFilterVideoSubs() {
        
        self.playView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 240)
        self.addSubview(self.playView)
        self.playView.backgroundColor = .lightGray
        
        self.playItem = AVPlayerItem(url: NSURL(string: self.playUrl)! as URL)
        self.player.replaceCurrentItem(with: self.playItem)
        let playLayer:AVPlayerLayer = AVPlayerLayer.init(player: self.player)
        playLayer.frame = self.playView.bounds
        self.playView.layer.addSublayer(playLayer)
        
        self.player.pause()
        self.player.play()
        self.isPlaying = true
        
        let sigTap:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(playerInterrupted))
        sigTap.numberOfTapsRequired = 1
        self.playView.addGestureRecognizer(sigTap)
        
        self.segment = UISegmentedControl.init(items: ["正常","倍速", "渲染"])
        self.segment?.selectedSegmentIndex = 0
        self.segment?.frame = CGRect(x: 10, y: self.playView.frame.self.height + 100, width: SCREEN_WIDTH - 20, height: 50)
        self.addSubview(self.segment ?? UISegmentedControl())
        
        self.segment?.addTarget(self, action: #selector(segmentValueDidChange), for: .valueChanged)
        
        self.segment?.tintColor = .brown
        self.segment?.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor:UIColor.blue], for: .normal)
        self.segment?.setTitleTextAttributes([NSAttributedString.Key.font:CUFont(18), NSAttributedString.Key.foregroundColor:UIColor.black], for: .selected)

        
        
    }
    @objc func segmentValueDidChange(segment:UISegmentedControl) {
    
        switch segment.selectedSegmentIndex {
        case 0:
            doNormalPlay()
        case 1:
            self.playRate = 2
            playItemTrack(rate: self.playRate,item: self.playItem!)
        case 2:
            doVideoFilter()
        default:
            print("")
        }
    }
    @objc func playerInterrupted() {
        
        if self.isPlaying == true {
            self.player.pause()
            self.isPlaying = false
        } else {
            self.player.play()
            self.isPlaying = true
        }
    }
    @objc func playFinished() {
        
        self.player.seek(to: CMTime(value: 0, timescale: 1))
        self.player.play()
    }
    func playItemTrack(rate:CGFloat, item:AVPlayerItem) {
        
        self.player.rate = Float(rate)
        // 设置播放速度...
        for track in self.playItem!.tracks {
            if track.assetTrack?.mediaType == .video {
                print("currentVideoFrameRate:\(track.currentVideoFrameRate)")
                track.isEnabled = true
            }
        }
    }
    func doNormalPlay() {
        
        self.playItem = AVPlayerItem(url: NSURL(string: self.playUrl)! as URL)
        self.player.replaceCurrentItem(with: self.playItem!)
        playItemTrack(rate: 1.0, item: self.playItem!)
    }
    func doVideoFilter() {
        
        let avAsset:AVURLAsset = AVURLAsset(url: NSURL(string: self.playUrl)! as URL)
        let filter:CIFilter = CIFilterEngine.filterByName(filterName: "CIPhotoEffectTonal")

        let composition = AVVideoComposition(asset: avAsset, applyingCIFiltersWithHandler: { request in
            let source = request.sourceImage.clampedToExtent()
            
            filter.setValue(source, forKey: kCIInputImageKey)
            let output = filter.outputImage?.cropped(to: request.sourceImage.extent)
            if let output = output {
                request.finish(with: output, context: nil)
            }
        });
        self.playItem = AVPlayerItem.init(asset: avAsset)
        self.playItem?.videoComposition = composition
        self.player .replaceCurrentItem(with: self.playItem)
        self.player.play()
    }

}
