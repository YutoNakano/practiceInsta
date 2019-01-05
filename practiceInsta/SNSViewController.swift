//
//  SNSViewController.swift
//  practiceInsta
//
//  Created by 中野湧仁 on 2019/01/03.
//  Copyright © 2019年 中野湧仁. All rights reserved.
//

import UIKit

class SNSViewController: UIViewController {
    
    //受け取り用の変数
    
    var endImage:UIImage = UIImage()
    
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var endImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        endImageView.image = endImage
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func post(_ sender: Any) {
        
        do{
            
            let activityViewConroller = UIActivityViewController(activityItems: [endImage], applicationActivities: nil)
            present(activityViewConroller, animated: true, completion: nil)
            
            
        }catch let error{
            print(error)
        }
        
        
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

