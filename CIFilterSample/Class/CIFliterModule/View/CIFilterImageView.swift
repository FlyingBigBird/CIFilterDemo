//
//  CIFilterImageView.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/4.
//  Copyright © 2019 Boris. All rights reserved.
//

import UIKit

class CIFilterImageView: UIView {

    var originImage:UIImage?
    var imgView:UIImageView?
    var segment:UISegmentedControl?
    var filterName:String = "CIUnsharpMask"
    var filterNames:NSArray?
    var i:NSInteger = 0
    
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
      
        self.filterNames = CIFilterEngine.filterNames(category: kCICategoryColorEffect) as NSArray
        print("filterNames:\(filterNames ?? NSArray())")
        
        self.originImage = UIImage(named: "High-Sierra")
        let originWidth:CGFloat  = self.originImage?.size.width ?? SCREEN_WIDTH
        let originHeight:CGFloat = self.originImage?.size.height ?? 200
        var getWidth:CGFloat     = 0
        var getHeight:CGFloat    = 0
        if originWidth >= SCREEN_WIDTH {
            getWidth = SCREEN_WIDTH
        } else {
            getWidth = originWidth
        }
        getHeight = getWidth * originHeight / originWidth
        self.imgView = UIImageView.init(frame: CGRect(x: SCREEN_WIDTH / 2 - getWidth / 2, y: 0, width: getWidth, height: getHeight))
        self.imgView?.image = self.originImage
        self.addSubview(self.imgView ?? UIImageView())
        
        self.segment = UISegmentedControl.init(items: ["正常", "褐色", "变形", "褪色","高光","镭射","热能","随机"])
        self.segment?.selectedSegmentIndex = 0
        self.segment?.frame = CGRect(x: 10, y: getHeight + 100, width: SCREEN_WIDTH - 20, height: 50)
        self.addSubview(self.segment ?? UISegmentedControl())
        
        self.segment?.addTarget(self, action: #selector(segmentValueDidChange), for: .valueChanged)
        
        self.segment?.tintColor = .lightGray
        self.segment?.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor:UIColor.blue], for: .normal)
        self.segment?.setTitleTextAttributes([NSAttributedString.Key.font:CUFont(18), NSAttributedString.Key.foregroundColor:UIColor.black], for: .selected)

    }

    @objc func segmentValueDidChange(segment:UISegmentedControl) {
        
        let context:CIContext = CIFilterEngine.contextByType(contextType: .OnGPU)
        
        switch segment.selectedSegmentIndex {
        case 0:
            print("selectedSegmentIndex:\(segment.selectedSegmentIndex)")
            self.imgView?.image = self.originImage
        case 1:
            filterName = "CISepiaTone"
        case 2:
            filterName = "CIPinchDistortion"
        case 3:
            filterName = "CIPhotoEffectFade"
        case 4:
            filterName = "CIUnsharpMask"
        case 5:
            filterName = "CIXRay"
        case 6:
            filterName = "CIThermal"
        case 7:
            
            let nums:NSInteger = self.filterNames?.count ?? 0
            let randNum:NSInteger = Int(arc4random())%(nums-1)
            let getName:String = String("\(self.filterNames?[randNum] ?? "CIUnsharpMask")")
            filterName = getName

            
        default:
            print("selectedSegmentIndex:\(segment.selectedSegmentIndex)")
        }
        if segment.selectedSegmentIndex != 0 {

          
            DispatchQueue.main.async(execute: {
                
                self.imgView?.image = UIImage()
                let getImg:UIImage = CIFilterEngine.generateImageRef(img: self.originImage ?? UIImage(), filterName: self.filterName , context: context)
                self.imgView?.image = getImg
            })
     
        }
        
    }


}
