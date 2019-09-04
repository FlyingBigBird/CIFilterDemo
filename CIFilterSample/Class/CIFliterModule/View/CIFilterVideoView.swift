//
//  CIFilterVideoView.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/4.
//  Copyright © 2019 Boris. All rights reserved.
//

import UIKit

class CIFilterVideoView: UIView {

    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        self.backgroundColor = .white
        showFilterVideoSubs()
    }
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func showFilterVideoSubs() {
        
        
    }

}
