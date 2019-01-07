//
//  ViewController.swift
//  practiceInsta
//
//  Created by 中野湧仁 on 2019/01/02.
//  Copyright © 2019年 中野湧仁. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var saveImage:UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ユーザーに許可を促す.
        PHPhotoLibrary.requestAuthorization { (status) -> Void in
            
            switch(status){
            case .authorized:
                print("Authorized")
                
            case .denied:
                print("Denied")
                
            case .notDetermined:
                print("NotDetermined")
                
            case .restricted:
                print("Restricted")
            }
            
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func camera(_ sender: Any) {
        print("huga")
        let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }else{
            
            print("エラー")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "next"){
            
            let subVC:FilterViewController = segue.destination as! FilterViewController
            
            subVC.passImage = saveImage
            
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if (info[.originalImage] as? UIImage) != nil
        {
            
            saveImage = info[.originalImage] as! UIImage
            
            
            //閉じる処理
            picker.dismiss(animated: true, completion: nil)
            //画面遷移
            performSegue(withIdentifier: "next", sender: nil)
            
            
            
            
        }
        
    }
    
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func album(_ sender: Any) {
        
        
        let sourceType:UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            print("エラー")
            
        }
        
        
        
    }
    
    
}

