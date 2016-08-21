//
//  SubViewController.swift
//  table
//
//  Created by 丹羽未咲紀 on 2016/08/21.
//  Copyright © 2016年 丹羽未咲紀. All rights reserved.
//


import Foundation

import UIKit

class SubViewController: UIViewController{
    
    var selectedImg: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}