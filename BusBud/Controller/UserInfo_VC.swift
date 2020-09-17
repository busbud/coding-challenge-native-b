//
//  UserInfo_VC.swift
//  BusBud
//
//  Created by Sajjad Sarkoobi on 9/16/20.
//

import UIKit

class UserInfo_VC: UIViewController {

    
    //IBOutlet & IBAction:
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var startBtn: UIButton!
    @IBAction func startBtnAction(_ sender: UIButton) {
        openNextPage()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationTitleLogo()
        
        setView()
       
        setTapGestureForDismissingKeyboard()
        
        cleanNavigationBar()
    }
    

    func setView(){
        nameTxtField.layer.borderWidth = 1.0
        nameTxtField.layer.borderColor = AppColors.defult.mainBlueColor.cgColor
        nameTxtField.round(5)
        nameTxtField.delegate = self
        
        startBtn.backgroundColor = AppColors.defult.mainBlueColor
        startBtn.setTitleColor(.white, for: .normal)
        startBtn.round(5)
        
    }
    
    
    func setTapGestureForDismissingKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }


    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        nameTxtField.resignFirstResponder()
    }
    
    
    func openNextPage(){
        
        if let name = nameTxtField.text {
            Global_Variables.userName = name
        }
        
        guard let controller = self.storyboard?.instantiateViewController(identifier: "MainTabBar_VCId") as? MainTabBar_VC else {
            return
        }
        
        controller.modalPresentationStyle = .fullScreen
            
            
        self.navigationController?.present(controller, animated: true, completion: nil)
        
    }
    
    deinit {
        print("[deinit] UserInfo_VC")
    }

    
}


extension UserInfo_VC : UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
}
