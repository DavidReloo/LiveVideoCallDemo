//
//  ViewController.swift
//  LiveVideoCallDemo
//
//  Created by Larry on 2022/9/30.
//

import UIKit
import ZegoUIKitPrebuiltCall
import ZegoUIKitSDK

class ViewController: UIViewController {

    let appID: UInt32 = <#yourAppID#>
    let appSign = <#yourAppSign#>
    let callID = "callID111"
    let userID = "userID" + String(Int.random(in: 0..<1000))
    let userName = "User" + String(Int.random(in: 0..<100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pressCallButton(_ sender: UIButton) {
        oneOnOneVideoCall()
    }
    
    private func oneOnOneVideoCall() {
        let config: ZegoUIKitPrebuiltCallConfig = ZegoUIKitPrebuiltCallConfig(.oneOnOneVideoCall)
        let callVC = ZegoUIKitPrebuiltCallVC(appID, appSign: appSign, userID: userID, userName: userName, callID: callID, config: config)
        callVC.modalPresentationStyle = .fullScreen
        self.present(callVC, animated: true, completion: nil)
    }

    private func pictureInPictureLayout() {
        // Modify your custom configurations here.
        let config: ZegoUIKitPrebuiltCallConfig = ZegoUIKitPrebuiltCallConfig(.oneOnOneVideoCall)

        let layout: ZegoLayout = ZegoLayout()
        layout.mode = .pictureInPicture
        let pipConfig: ZegoLayoutPictureInPictureConfig = ZegoLayoutPictureInPictureConfig()
        pipConfig.showMyViewWithVideoOnly = true;
        pipConfig.isSmallViewDraggable = true;
        pipConfig.switchLargeOrSmallViewByClick = true;
        layout.config = pipConfig
        config.layout = layout

        let callVC = ZegoUIKitPrebuiltCallVC(appID, appSign: appSign, userID: userID, userName: userName, callID: callID, config: config)
        callVC.modalPresentationStyle = .fullScreen
        self.present(callVC, animated: true, completion: nil)
    }

    private func galleryLayout() {
        let config: ZegoUIKitPrebuiltCallConfig = ZegoUIKitPrebuiltCallConfig(.groupVideoCall)

        let layout: ZegoLayout = ZegoLayout()
        layout.mode = .gallery
        let layoutConfig: ZegoLayoutGalleryConfig = ZegoLayoutGalleryConfig()
        layoutConfig.addBorderRadiusAndSpacingBetweenView = false;
        layout.config = layoutConfig
        config.layout = layout

        let callVC = ZegoUIKitPrebuiltCallVC(appID, appSign: appSign, userID: userID, userName: userName, callID: callID, config: config)
        callVC.modalPresentationStyle = .fullScreen
        self.present(callVC, animated: true, completion: nil)
    }
}
