//
//  RandomCollectionViewCell.swift
//  Trevi_Interview
//
//  Created by 黃聖傑 on 2018/11/19.
//  Copyright © 2018 seaFoodBon. All rights reserved.
//

import UIKit

class RandomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var leadingLine: UIView!
    @IBOutlet weak var trailingLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var backGraondView: UIView!
    @IBOutlet weak var backGroundUnderView: UIView!
    @IBOutlet weak var randomLabel: UILabel!
    
    var cellData:RandomCellData!{
        didSet{
            self.setBackGroundColor(mode: cellData.backGroundMode)
            self.setBaseLineShowMode(mode: cellData.baseLineShowMode)
            self.randomLabel.isHidden = cellData.isHideRandomLabel
        }
    }
    
    private func setBackGroundColor(mode:BackGroundColorMode){
        switch mode {
        case .red:
            self.backGraondView.backgroundColor = UIColor.customLightRed()
            self.backGroundUnderView.backgroundColor = UIColor.customRed()
        case .greed:
            self.backGraondView.backgroundColor = UIColor.customLightGreen()
            self.backGroundUnderView.backgroundColor = UIColor.customGreen()
        case .orange:
            self.backGraondView.backgroundColor = UIColor.customLightOrange()
            self.backGroundUnderView.backgroundColor = UIColor.customOrange()
        default :
            assert(false)
            self.backGraondView.backgroundColor = UIColor.clear
            self.backGroundUnderView.backgroundColor = UIColor.clear
        }
    }
    private func setBaseLineShowMode(mode:BaseLineShowMode){
        switch mode {
        case .top:
            self.topLine.backgroundColor = UIColor.customBaseLineColor()
            self.leadingLine.backgroundColor = UIColor.customBaseLineColor()
            self.trailingLine.backgroundColor = UIColor.customBaseLineColor()
            self.bottomLine.backgroundColor = .clear
        case .middle:
            self.topLine.backgroundColor = .clear
            self.leadingLine.backgroundColor = UIColor.customBaseLineColor()
            self.trailingLine.backgroundColor = UIColor.customBaseLineColor()
            self.bottomLine.backgroundColor = .clear
        case .bottom:
            self.topLine.backgroundColor = .clear
            self.leadingLine.backgroundColor = UIColor.customBaseLineColor()
            self.trailingLine.backgroundColor = UIColor.customBaseLineColor()
            self.bottomLine.backgroundColor = UIColor.customBaseLineColor()
        case .hidden:
            self.topLine.backgroundColor = .clear
            self.leadingLine.backgroundColor = .clear
            self.trailingLine.backgroundColor = .clear
            self.bottomLine.backgroundColor = .clear
        }
    }
}



struct RandomCellData {
    let isHideRandomLabel:Bool
    let baseLineShowMode:BaseLineShowMode
    let backGroundMode:BackGroundColorMode
}
enum BaseLineShowMode:Int{
    case top = 0
    case middle = 1
    case bottom = 2
    case hidden = 3
}
enum BackGroundColorMode{
    case red
    case greed
    case orange
    case black
    case highlightBlue
}
