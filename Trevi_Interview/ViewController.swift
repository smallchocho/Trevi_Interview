//
//  ViewController.swift
//  Trevi_Interview
//
//  Created by 黃聖傑 on 2018/11/19.
//  Copyright © 2018 seaFoodBon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var columTextField: UITextField!
    @IBOutlet weak var rowTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clickedButton(_ sender: Any) {
        guard let colum = Int(self.columTextField.text!) else{ return }
        guard let row = Int(self.rowTextField.text!) else{ return }
        self.onClickedButton(colum:colum,row:row)
    }
    private func onClickedButton(colum:Int,row:Int){
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RandomViewController") as? RandomViewController else{ return }
        vc.gridCount = GridCount(columCount : colum, rowCount : row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

struct GridCount {
    let columCount:Int
    let rowCount:Int
}

