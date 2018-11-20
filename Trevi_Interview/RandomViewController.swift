//
//  RandomViewController.swift
//  Trevi_Interview
//
//  Created by 黃聖傑 on 2018/11/19.
//  Copyright © 2018 seaFoodBon. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {
    @IBOutlet weak var randomCollectionView: UICollectionView!
    var randomRow:Int!{
        didSet{ self.randomCollectionView.reloadData() }
    }
    var gridCount:GridCount!
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.randomCollectionView.delegate = self
        self.randomCollectionView.dataSource = self
        self.randomGridRow()
        self.timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { (timer) in
            self.randomGridRow()
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension RandomViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gridCount.columCount * gridCount.rowCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let isLastLineCell = gridCount.columCount * gridCount.rowCount - indexPath.row <= gridCount.columCount
        if isLastLineCell{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as? ButtonCollectionViewCell  else{
                return UICollectionViewCell()
            }
            cell.cellData = createCellData(indexPath: indexPath)
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RandomCell", for: indexPath) as? RandomCollectionViewCell  else{
                return UICollectionViewCell()
            }
        cell.cellData = createCellData(indexPath: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let backGroundSize = self.randomCollectionView.frame.size
        let cellSize = CGSize(width: backGroundSize.width/CGFloat(self.gridCount.columCount), height: backGroundSize.height/CGFloat(self.gridCount.rowCount))
        return cellSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    private func createCellData(indexPath:IndexPath) -> RandomCellData{
        let isHideRandomLabel = indexPath.row != randomRow
        var backGroundMode:BackGroundColorMode!
        let isLastLineCell = gridCount.columCount * gridCount.rowCount - indexPath.row <= gridCount.columCount
        if isLastLineCell {
            backGroundMode = BackGroundColorMode.black
        }else{
            let modeInt = ( indexPath.row / gridCount.columCount ) % 3
            if modeInt == 0 { backGroundMode = BackGroundColorMode.red }
            if modeInt == 1 { backGroundMode = BackGroundColorMode.greed }
            if modeInt == 2 { backGroundMode = BackGroundColorMode.orange }
        }
        var baselineShowMode:BaseLineShowMode!
        
        if indexPath.row % gridCount.columCount != randomRow % gridCount.columCount{
            baselineShowMode = BaseLineShowMode.hidden
        }
        else if indexPath.row + 1 <= gridCount.columCount {
            baselineShowMode = BaseLineShowMode.top
        }
        else if isLastLineCell {
            baselineShowMode = BaseLineShowMode.bottom
            backGroundMode = BackGroundColorMode.highlightBlue
        }
        else{
            baselineShowMode = BaseLineShowMode.middle
        }
        return RandomCellData(isHideRandomLabel: isHideRandomLabel, baseLineShowMode: baselineShowMode, backGroundMode: backGroundMode)
    }
    
    private func randomGridRow(){
        randomRow = Int(arc4random_uniform(UInt32(gridCount.columCount * (gridCount.rowCount-1))))
    }
    
}
