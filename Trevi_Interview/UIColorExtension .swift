//
//  UIColorExtension .swift
//  Trevi_Interview
//
//  Created by 黃聖傑 on 2018/11/20.
//  Copyright © 2018 seaFoodBon. All rights reserved.
//

import UIKit
extension UIColor{
    static func customRed()->UIColor{
        return UIColor(displayP3Red: 184.0/255, green:40.0/255, blue: 39.0/255, alpha: 1)
    }
    static  func customLightRed()->UIColor{
        return UIColor(displayP3Red: 230.0/255, green:218.0/255, blue: 215.0/255, alpha: 1)
    }
    static  func customGreen()->UIColor{
        return UIColor(displayP3Red: 20.0/255, green: 158.0/255, blue: 14.0/255, alpha: 1)
    }
    static  func customLightGreen()->UIColor{
        return UIColor(displayP3Red: 221.0/255, green: 235.0/255, blue: 220.0/255, alpha: 1)
    }
    static func customOrange()->UIColor{
        return UIColor(displayP3Red: 179.0/255, green: 73.0/255, blue: 41.0/255, alpha: 1)
    }
    static func customLightOrange()->UIColor{
        return UIColor(displayP3Red: 220.0/255, green: 218.0/255, blue: 215.0/255, alpha: 1)
    }
    static func customBaseLineColor()->UIColor{
        return UIColor(displayP3Red: 27.0/255, green: 211.0/255, blue: 213.0/255, alpha: 1)
    }
    static func customButtomCellTextColor()->UIColor{
        return UIColor(displayP3Red: 159.0/255, green: 159.0/255, blue: 159.0/255, alpha: 1)
    }
}
