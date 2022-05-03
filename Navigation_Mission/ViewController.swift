//
//  ViewController.swift
//  Navigation_Mission
//
//  Created by hyeonsik on 2022/05/02.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    var isZoom = false
    var orgZoom = false
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 세그웨이를 이용하여 화면을 전환하기 위해 사용되는 함수
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use Button"
        }
        else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar Button"
        }
        
        editViewController.textMessage = txMessage.text! // 메인 -> 수정 화면으로 데이터 이동
        editViewController.isZoom = orgZoom
        editViewController.isOn = isOn // 전구의 상태를 전달
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        }
        else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if isZoom {
            if (orgZoom != true) {
                self.isZoom = false
                self.orgZoom = true
                newWidth = imgView.frame.width * scale
                newHeight = imgView.frame.height * scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
        }
        else {
            if (orgZoom == true) {
                self.isZoom = true
                self.orgZoom = false
                newWidth = imgView.frame.width / scale
                newHeight = imgView.frame.height / scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
        }
        
        
//        self.isZoom = !isZoom
    }
    


}

