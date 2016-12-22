//
//  DataModel.swift
//  test
//
//  Created by 方振宇 on 2016/12/22.
//  Copyright © 2016年 方振宇. All rights reserved.
//

import Foundation
class DataModel {
    static let datesoureforpickview:[String : [String:[String]]] = ["力学计量":["压力表":["FP1a","FP1b","FP1c"],"氩气减压器":["FF12"],"3个怎么办":["1","2","3"]],"长度计量":["游标卡尺":["0-5mm","6-10mm"],"平板":["平板"]]]
    static public func getFirstKeys() -> [String] {
        return datesoureforpickview.keys.sorted()
    }
  static  public func getSecondfKeys(num1:Int) -> [String] {
        
        return (datesoureforpickview[datesoureforpickview.keys.sorted()[num1]]?.keys.sorted())!
    }
   static public func getThirdfKeys(num1:Int,num2:Int) -> [String] {
        let key1 = datesoureforpickview.keys.sorted()[num1]
        let key2 = datesoureforpickview[key1]!.keys.sorted()[num2]
        return datesoureforpickview[key1]?[key2] ?? [""]
    }
    
    
}
