//
//  ViewController.swift
//  table
//
//  Created by 丹羽未咲紀 on 2016/08/21.
//  Copyright © 2016年 丹羽未咲紀. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var table:UITableView!
    
    let imgArray: NSArray = ["img0.jpg","img1.jpg","img2.jpg","img3.jpg",
                             "img4.jpg","img5.jpg","img6.jpg","img7.jpg"]
    
    let label2Array: NSArray = ["2013/8/23/16:04","2013/8/23/16:15","2013/8/23/16:47","2013/8/23/17:10",
                                "2013/8/23/17:15","2013/8/23/17:21","2013/8/23/17:33","2013/8/23/17:41"]
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Table Viewのセルの数を指定
    func tableView(table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        let img = UIImage(named:"\(imgArray[indexPath.row])")
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = img
        
//        // Tag番号 ２ で UILabel インスタンスの生成
//        let label1 = table.viewWithTag(2) as! UILabel
//        label1.text = "No.\(indexPath.row + 1)"
//        
//        // Tag番号 ３ で UILabel インスタンスの生成
//        let label2 = table.viewWithTag(3) as! UILabel
//        label2.text = "\(label2Array[indexPath.row])"
        
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    // Cell が選択された場合
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named:"\(imgArray[indexPath.row])")
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toSubViewController",sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toSubViewController") {
            let subVC: SubViewController = (segue.destinationViewController as? SubViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedImg = selectedImage
        }
    }
    
}