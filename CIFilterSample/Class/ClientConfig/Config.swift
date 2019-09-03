//
//  Config.swift
//  CIFilterSample
//
//  Created by BaoBaoDaRen on 2019/9/3.
//  Copyright © 2019 Boris. All rights reserved.
//

import Foundation
import UIKit

/**
 屏幕Frame
 */
let ScreenFrame = UIScreen.main.bounds

/**
 *define:获取屏幕的宽
 */
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

/**
 *define:获取屏幕的高
 */
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

// appdelegate
let APP_Delegate = UIApplication.shared.delegate as? AppDelegate

let SafeAreaTopHeight = (SCREEN_HEIGHT >= 812.0) && (UIDevice.current.model == "iPhone") ? 88 : 64
let SafeAreaBottomHeight = (SCREEN_HEIGHT >= 812.0) && (UIDevice.current.model == "iPhone") ? 30 : 0

let BackGroundColor = "#F8F7FC"
let GeneralTextColor = "#333333"
let SeparatorLineColor = "#e4e4e4"
let BackGreenColor = "#2f6f6f"
let BackBlackColor = "#2f2f2f"

func RGBA(_ R: Float, _ G: Float, _ B: Float, _ A: Float) -> UIColor {
    return UIColor(red: CGFloat(R / 255.0), green: CGFloat(G / 255.0), blue: CGFloat(B / 255.0), alpha: CGFloat(A))
}
//#define HEX_C(color) [UIColor colorWithHexString:@"%@",color]


let GDeepGrayColor = "#666666"
let GGrayColor = "#999999"
let GClearColor = UIColor.clear
let GBlackColor = "#2F2F2F"
let GWhiteColor = "#FFFFFF"
let GBackGroundColor = "#1B696D"
let GBoarderColor = "#CCCCCC"
let GTableBGColor = "#F3F4F6"
let GColorGray = UIColor.gray


let GPlaceHolder = UIImage(named: "placeHolder")

// 适配比例，一般为1：1.25...
let ZoomValue = 1.25

// 强弱引用...
//#define WeakSelf(type) __weak typeof(type) weak##type = type;
//#define StrongSelf(type) __strong typeof(type) type = weak##type;

// 获取temp
let PathTemp = NSTemporaryDirectory()

// 获取沙盒 Document
let PathDocument = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first

// 获取沙盒 Cache
let PathCache = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first


// 选择Font
func FontL(_ s: Float) -> UIFont {
    return UIFont.systemFont(ofSize: CGFloat(s), weight: .light)
}
func FontR(_ s: Float) -> UIFont {
    return UIFont.systemFont(ofSize: CGFloat(s), weight: .regular)
}
func FontB(_ s: Float) -> UIFont {
    return UIFont.systemFont(ofSize: CGFloat(s), weight: .bold)
}
func FontT(_ s: Float) -> UIFont {
    return UIFont.systemFont(ofSize: CGFloat(s), weight: .thin)
}
func Font(_ s: Float) -> UIFont {
    return UIFont.systemFont(ofSize: CGFloat(s))
}
func CUFont(_ s: Float) -> UIFont {
    return UIFont(name: "Helvetica-Bold", size: CGFloat(s))!
}

//加入这个宏，可以省略所有 mas_ （除了mas_equalTo）
//#define MAS_SHORTHAND

//加入这个宏，那么mas_equalTo就和equalTo一样的了
//#define MAS_SHORTHAND_GLOBALS

//上面的两个宏一定要在这句之前
//#import "Masonry.h"

/**
 *define:iOS 7.0的版本判断
 */
let iOS7_OR_LATER = UIDevice.current.systemVersion.compare("7", options: .numeric, range: nil, locale: .current) != .orderedAscending

let iOS8_OR_LATER = UIDevice.current.systemVersion.compare("8", options: .numeric, range: nil, locale: .current) != .orderedAscending

/**
 *define:iOS 9.0的版本判断
 */
let iOS9_OR_LATER = UIDevice.current.systemVersion.compare("9", options: .numeric, range: nil, locale: .current) != .orderedAscending

/**
 *define:iOS 10.0的版本判断
 */
let iOS10_OR_LATER = UIDevice.current.systemVersion.compare("10", options: .numeric, range: nil, locale: .current) != .orderedAscending

/**
 *define:iOS 11.0的版本判断
 */
let iOS11_OR_LATER = UIDevice.current.systemVersion.compare("11", options: .numeric, range: nil, locale: .current) != .orderedAscending

/**
 *define:iOS 12.0的版本判断
 */
let iOS12_OR_LATER = UIDevice.current.systemVersion.compare("12", options: .numeric, range: nil, locale: .current) != .orderedAscending

/**
 *define:屏幕的宽高比
 */
func CURRENT_SIZE(_ size: CGFloat) -> CGFloat {
    return size / 375.0 * SCREEN_WIDTH
}

/**
 *  设备判断...
 */
let iPhone4 = UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) ? CGSize(width: 640, height: 960).equalTo(UIScreen.main.currentMode!.size) : false
let iPhone5 = UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) ? CGSize(width: 640, height: 1136).equalTo(UIScreen.main.currentMode!.size) : false
let iPhone6 = UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) ? CGSize(width: 750, height: 1334).equalTo(UIScreen.main.currentMode!.size) : false
let iPhone6plus = UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo(UIScreen.main.currentMode!.size) : false
let iPhoneX = UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo(UIScreen.main.currentMode!.size) : false

let is_Pad = UIDevice.current.userInterfaceIdiom == .pad

let IS_IPHONE_X = UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo(UIScreen.main.currentMode!.size) && !is_Pad : false
//判断iPhoneXr
let IS_IPHONE_Xr = (UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) ? CGSize(width: 828, height: 1792).equalTo(UIScreen.main.currentMode!.size) && !is_Pad : false || UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) ? CGSize(width: 750, height: 1624).equalTo(UIScreen.main.currentMode!.size) && !is_Pad : false)

//判断iPhoneXsMax
let IS_IPHONE_Xs_Max = UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo(UIScreen.main.currentMode!.size) && !is_Pad : false

//判断iPhoneX所有系列
let ISIPhoneXSeries = IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs_Max
let StatusBar_H = ISIPhoneXSeries ? 44.0 : 20.0
let NavBar_H = 44
let TabBar_H = ISIPhoneXSeries ? 83.0 : 49.0

let iPad = (UIScreen.main.currentMode?.size.width ?? 0.0) / (UIScreen.main.currentMode?.size.height ?? 0.0) > 0.7
let iOS9 = Double(UIDevice.current.systemVersion) ?? 0.0 >= 9.0

let kNOTSUPPORTCAMERAL = "设备不支持访问相册，请在设置->隐私->相机中进行设置！"
let kNOTSUPPORTALBUM = "设备不支持访问相册，请在设置->隐私->照片中进行设置！"

let OPEN_SETTING_PATH = UIApplication.shared.openURL(NSURL.init(fileURLWithPath: UIApplication.openSettingsURLString) as URL)

/*
 * iPad调起相机需在主线程完成...
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Privacy&path=PHOTOS"]]
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"]]
 */

//应用程序当前版本号
func CurrentVersionInfo() -> NSDictionary {
    
    return Bundle.main.infoDictionary! as NSDictionary
}

