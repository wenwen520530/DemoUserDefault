//
//  ViewController.swift
//  WenDemoUserDefault
//
//  Created by WENWENMAC on 2017/4/19.
//  Copyright © 2017年 WENWEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userDefault:UserDefaults = UserDefaults.standard //建立物件 沒有NS開頭 standard後面也沒有（）
    @IBOutlet weak var textFieldName: UITextField!
    @IBAction func clearClick(_ sender: UIButton) {
        userDefault.removeObject(forKey: "userName")
        textFieldName.text = ""
        alertOneBtn(pTitle: "清除資料", pMessage: "姓名資料已清除", btnTitle: "確定")//因為UIAlertController 這個物件在另一個button也會用，所以先以alertOneBtn 函式把相關的UIAlertController定義集合起來
    }
    @IBAction func inputClick(_ sender: UIButton) {
        userDefault.set(textFieldName.text, forKey: "userName")//和課本不一樣 把 .setObject 改為 .set
        userDefault.synchronize() // 更新資料，讓資料庫與現有資料立即同步
        alertOneBtn(pTitle: "寫入資料", pMessage: "姓名資料已寫入！", btnTitle: "確定")
    }

    
    func alertOneBtn(pTitle:String , pMessage:String , btnTitle:String){
        let alertController = UIAlertController(title: pTitle, message: pMessage, preferredStyle: UIAlertControllerStyle.alert)
        let sureAction = UIAlertAction(title: btnTitle, style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(sureAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        let name:String? = userDefault.object(forKey: "userName") as! String?  //讀取資料,這一行不能漏寫哦
        
        if name == nil {//沒有資料
            alertOneBtn(pTitle: "輸入姓名", pMessage: "歡迎使用本應用程式 \n 你尚未建立基本資料，請輸入姓名", btnTitle: "確定")
        }else{//資料已存在
            let msg:String = "親愛的" + name! + ",你好 \n歡迎再次使用本應用程式！"
            alertOneBtn(pTitle: "歡迎", pMessage: msg, btnTitle: "確定")
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

