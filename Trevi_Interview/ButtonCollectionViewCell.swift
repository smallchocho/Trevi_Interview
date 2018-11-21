//
//  ButtonCollectionViewCell.swift
//  Trevi_Interview
//
//  Created by 黃聖傑 on 2018/11/20.
//  Copyright © 2018 seaFoodBon. All rights reserved.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var leadingLine: UIView!
    @IBOutlet weak var trailingLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    
    var cellData:RandomCellData!{
        didSet{
            self.setBackGroundColor(mode:cellData.backGroundMode)
            self.setBaseLineShowMode(mode: cellData.baseLineShowMode)
        }
    }

    
    private func setBackGroundColor(mode:BackGroundColorMode){
        switch mode {
        case .black:
            self.button.backgroundColor =  UIColor.clear
            self.button.setTitleColor(UIColor.customButtomCellTextColor(), for: .normal)
        case .highlightBlue:
            self.button.backgroundColor =  UIColor.customBaseLineColor()
            self.button.setTitleColor(UIColor.white, for: .normal)
        default :
            assert(false)
            self.button.backgroundColor = UIColor.clear
            self.button.setTitleColor(UIColor.clear, for: .normal)
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

