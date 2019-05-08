//
//  UIAlertController+Extension.swift
//  KakaobankTest
//
//  Created by rowkaxl on 08/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

extension UIAlertController {
    
    class func showAlert(title: String?, message: String?, style: UIAlertController.Style, actions: [AlertAction]) -> Observable<Int> {
        return Observable.create { observer in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            
            actions.enumerated().forEach { index, action in
                
                
                let image = action.image.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: -(alertController.view.bounds.width - 70), bottom: 0, right:0))

                let action = UIAlertAction(title: action.title, style: action.style) { _ in
                    observer.onNext(index)
                    observer.onCompleted()
                }
                
                action.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
                action.setValue(image, forKey: "image")
                
                alertController.addAction(action)
            }
            
            alertController.addAction(UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: { (_) in
                alertController.dismiss(animated: true)
            }))
            
            UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
            
            return Disposables.create { alertController.dismiss(animated: true, completion: nil) }
        }
    }
}

struct AlertAction {
    var title: String
    var image: UIImage
    var style: UIAlertAction.Style
    
    static func action(title: String, image: UIImage, style: UIAlertAction.Style = .default) -> AlertAction {
        return AlertAction(title: title, image: image, style: style)
    }
}
