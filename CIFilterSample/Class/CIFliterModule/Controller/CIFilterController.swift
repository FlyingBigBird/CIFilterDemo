//
//  CIFilterController.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/3.
//  Copyright © 2019 Boris. All rights reserved.
//

import UIKit

class CIFilterController: UIViewController {

    public var filterType:CIFilterType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if responds(to: #selector(setter: self.edgesForExtendedLayout)) {
            edgesForExtendedLayout = []
        }
        automaticallyAdjustsScrollViewInsets = false
        if #available(iOS 11.0, *) {
            
        } else {
            // Fallback on earlier versions
        }
        
        
        showFilterSubs()
    }
    func showFilterSubs() {
        switch filterType {
        case .image?:
            self.title = "图片渲染"
            imageFilterBegin()
        case .video?:
            self.title = "视频渲染"
            videoFilterBegin()
        default:
            print("")
        }
    }
    func imageFilterBegin() {
        
        let imageFilterView:CIFilterImageView = CIFilterImageView.init(frame: self.view.bounds)
        self.view.addSubview(imageFilterView)
    }
    func videoFilterBegin() {
        
        let videoFilterView:CIFilterVideoView = CIFilterVideoView.init(frame: self.view.bounds)
        self.view.addSubview(videoFilterView)
    }
}


