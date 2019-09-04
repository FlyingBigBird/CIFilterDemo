//
//  ViewController.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/3.
//  Copyright © 2019 Boris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        
        self.view.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        showFilterUI()
    }
    func showFilterUI() {
      
        self.title = "CIFilter渲染"
        let filetrView:CIFIlterView = CIFIlterView.init(frame: self.view.bounds)
        self.view.addSubview(filetrView)
    
        filetrView.filterWithType { (filterType) in
            
            let filterVC:CIFilterController = CIFilterController()
            filterVC.filterType = filterType
            self.navigationController?.pushViewController(filterVC, animated: true)
        }
    }


}

