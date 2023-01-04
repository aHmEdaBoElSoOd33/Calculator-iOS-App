//
//  ViewController.swift
//  Calculator
//
//  Created by Ahmed on 04/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var CalcBtn: [UIButton]!
    
    @IBOutlet weak var resultLbl: UILabel!
    
    var result : Double = 0.0
    var fristNumber : Double?
    var operation : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in CalcBtn {
            i.layer.cornerRadius = i.frame.height / 2
        }
    }

    func result(FN:Double,SN:Double,OP:Int){
        
        switch OP{
        case 12 :
            result = FN + SN
        case 13 :
            result = FN - SN
        case 14 :
            result = FN * SN
        case 15 :
            result = FN / SN
        default:
            break;
        }
         
        
    }
    
    
    func clear(){
        resultLbl.text = "0"
    }
    
    func removeZero(){
        if resultLbl.text == "0"  {
            resultLbl.text=""
        }else if resultLbl.text == "-nan" || resultLbl.text == "inf"{
            resultLbl.text=""
        }
    }
    @IBAction func calcBtnAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 0...9:
            removeZero()
            resultLbl.text = resultLbl.text! + "\(sender.tag)"
        
        case 10 :
            
            if resultLbl.text!.contains("."){
                break ;
            }else{
                resultLbl.text = resultLbl.text! + "."
            }
        
        case 12...15 :
            fristNumber = Double(resultLbl.text!)
            operation = sender.tag
            clear()
            
        case 11 :
            guard let fristNumber = fristNumber else{return}
            result(FN: fristNumber, SN: Double(resultLbl.text!)!, OP: operation!)
            resultLbl.text = "\(result)"
        
        case 16 :
            
            resultLbl.text = "\(Double(resultLbl.text!)! / 100)"
             
        case 17 :
            
            if resultLbl.text != "0"{
                if resultLbl.text!.contains("-"){
                    resultLbl.text?.removeFirst()
                }else{
                    resultLbl.text? = "-"+resultLbl.text!
                }
            }
            
            
        
        case 18 :
            resultLbl.text = "0"
        
        default:
            break ;
        }
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
}

