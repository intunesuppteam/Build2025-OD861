//
//  UiUtils.swift
//  helloworld
//
//  Created by Raheem Chisman on 5/02/25.
//

import UIKit

 
class UIUtils{
    class func getCurrentViewController() -> UIViewController{
    var topController =
    UIApplication.shared.keyWindow?.rootViewController
        if (nil != topController) {
            var presentedViewController = topController!.presentedViewController
//Loop until there are no more view controllers to go to
while (nil != presentedViewController){topController = presentedViewController

presentedViewController = topController!.presentedViewController

}

 }

 //Return the final view controller

 return topController!

}

   }
