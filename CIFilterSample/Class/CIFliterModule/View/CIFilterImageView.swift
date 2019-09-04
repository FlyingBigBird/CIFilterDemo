//
//  CIFilterImageView.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/4.
//  Copyright © 2019 Boris. All rights reserved.
//

import UIKit

class CIFilterImageView: UIView {

    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
     
        self.backgroundColor = .white
        showFilterImageSubs()
    }
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func showFilterImageSubs() {
        
        
    }

}
