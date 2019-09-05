//
//  CIFilterEngine.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/3.
//  Copyright © 2019 Boris. All rights reserved.
//

/// 创建CIContext类别...
///
/// - OnCPU: 基于CPU创建
/// - OnGPU: 基于GPU创建,创建失败时默认基于CPU创建...
enum CIContextOnArchitecture {
    case OnCPU
    case OnGPU
}

/// 渲染类型
///
/// - image: 图片渲染...
/// - video: 视频渲染...
enum CIFilterType {
    case image
    case video
}

import UIKit

public class CIFilterEngine {
    
    private static let sharedEngien = CIFilterEngine()
    private init() {
        
    }
    // 静态访问方法...
    public static var shared: CIFilterEngine {
        
        return self.sharedEngien
    }
    
    /// 查询滤镜名称
    ///
    /// - Parameter category: 滤镜的类别
    /// - 常用类别有：kCICategoryDistortionEffect  kCICategoryColorEffect kCICategoryStylize
    /// - Returns: 相关类别包含的所有滤镜类型...
    class func filterNames (category:String) -> Array<Any> {
        
        let names:Array = CIFilter .filterNames(inCategory: category)
        return names
    }
    /// 创建CIContext上下文对象...
    ///
    /// - Parameter contextType: 基于cup/gpu...
    /// - Returns: CIContext
    class func contextByType(contextType:CIContextOnArchitecture) -> CIContext {
        
        let imgContext:CIContext?
        switch contextType {
        case .OnCPU:
            print("cpu")
            
            imgContext = CIContext.init(options: [CIContextOption.useSoftwareRenderer:true])
            
        case .OnGPU:
            print("gpu")
            
            imgContext = CIContext.init(eaglContext: EAGLContext.init(api: EAGLRenderingAPI.openGLES2)!)
        }
        return imgContext!
    }
    
    // 生成图片...
    class func generateImageRef(img:UIImage, filterName:String, context:CIContext) -> UIImage {
        
        var filterImg:UIImage = UIImage.init()
        
        let ciImage =  CIImage.init(cgImage: img.cgImage!)

        let filter:CIFilter = CIFilter(name: filterName, parameters: [kCIInputImageKey:ciImage])!
        filter.setDefaults()
        // 渲染CIImage
        let outputImg:CIImage = filter.outputImage ?? CIImage()
        
        // 创建像素位图...
        let placeCgImage:CGImage = img.cgImage!
        let cgImage:CGImage = context.createCGImage(outputImg, from: outputImg.extent) ?? placeCgImage
        filterImg = UIImage(cgImage: cgImage)
        
        return filterImg
    }
    
}

