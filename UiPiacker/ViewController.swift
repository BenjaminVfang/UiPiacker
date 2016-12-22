//
//  ViewController.swift
//  UiPiacker
//
//  Created by 方振宇 on 2016/12/22.
//  Copyright © 2016年 方振宇. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var textfieldforpick: UITextField!
    let pickview = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickview.frame=CGRect(x: 0.0, y: 0, width: self.view.bounds.width, height: 200)
        pickview.delegate=self
        pickview.dataSource=self
        textfieldforpick.inputView=pickview
//        textfieldforpick.placeholder = DataModel.getValue(num1: 0, num2: 0, num3: 0)
        textfieldforpick.text=DataModel.getValue(num1: 0, num2: 0, num3: 0)
        // Do any additional setup after loading the view, typically from a nib.
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(resignfirstresopnder))
        tapgesture.numberOfTapsRequired=1//default is 1,and we can set 2
        self.view.addGestureRecognizer(tapgesture)
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 3
    }
    
    
    // returns the # of rows in each component..
    var array0 = DataModel.getFirstKeys()
    var array1 = DataModel.getSecondfKeys(num1: 0){
        didSet{
            pickview.reloadComponent(1)
//            pickview.reloadComponent(2)
        }
    }
    var array2 = DataModel.getThirdfKeys(num1: 0, num2: 0){
        didSet{
            pickview.reloadComponent(2)
        }
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if component==0 {
            return array0.count
        }else if component==1{
            return array1.count
        }else{
            return array2.count
        }
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        //返回数值
        if component==0 {
            return  array0[row]
        }else if component==1{
            return  array1[row]
        }else{
            return  array2[row]
        }
        
    }
    
    var rowinfirstcomponent = 0
    var rowinsecondcomponentreal = 0
    var rowinthirdcomponentreal = 0
    var rowinsecondcomponent:Int {
       set {
        rowinsecondcomponentreal=newValue
        }
        get{
//            print(rowinsecondcomponentreal<=array1.count ? rowinsecondcomponentreal : array1.count)
            return    rowinsecondcomponentreal<=array1.count-1 ? rowinsecondcomponentreal : array1.count-1
        }
    }
    var rowinthirdcomponent:Int {
        set {
            rowinthirdcomponentreal=newValue
        }
        get{
            //            print(rowinsecondcomponentreal<=array1.count ? rowinsecondcomponentreal : array1.count)
            return    rowinthirdcomponentreal<=array2.count-1 ? rowinthirdcomponentreal : array2.count-1
        }
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        if component==0 {
            array1=DataModel.getSecondfKeys(num1: row)
            array2 = DataModel.getThirdfKeys(num1: row, num2: rowinsecondcomponent)
            rowinfirstcomponent=row
            textfieldforpick.text=DataModel.getValue(num1: row, num2: rowinsecondcomponent, num3: rowinthirdcomponent) ?? ""
        }else if component==1 {
            array2 = DataModel.getThirdfKeys(num1: rowinfirstcomponent, num2: row)
            rowinsecondcomponent=row
            textfieldforpick.text=DataModel.getValue(num1: rowinfirstcomponent, num2: row, num3: rowinthirdcomponent) ?? ""
        }else{
            textfieldforpick.text=DataModel.getValue(num1: rowinfirstcomponent, num2: rowinsecondcomponent, num3: row) ?? ""
            rowinthirdcomponent=row
        }
        
        
    }
    func resignfirstresopnder(sender:UITapGestureRecognizer)  {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

