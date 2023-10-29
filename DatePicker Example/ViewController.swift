//
//  ViewController.swift
//  DatePicker Example
//
//  Created by Hüseyin BAKAR on 29.10.2023.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var tfTarih: UITextField!
    
    @IBOutlet weak var tfSaat: UITextField!
    
    var datePicker: UIDatePicker?
    
    var timePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = datePicker
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        tfSaat.inputView = timePicker
        
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        
        view.addGestureRecognizer(gesture1)
        
        datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker:)), for: .valueChanged)
        
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
        }
        
        if #available(iOS 13.4, *) {
            timePicker?.preferredDatePickerStyle = .wheels
        }
        
        timePicker?.addTarget(self, action: #selector(saatGoster(uiDatePicker:)), for: .valueChanged)
    }
    
    @objc func dokunmaAlgilamaMetod(){
        print("Ekrana dokunuldu.")
        view.endEditing(true)
    }
    
    @objc func tarihGoster(uiDatePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "MM/dd/yyyy"
        let alinanTarih = format.string(from: uiDatePicker.date)
        
        tfTarih.text = alinanTarih
    }
    
    @objc func saatGoster(uiDatePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let alinanSaat = format.string(from: uiDatePicker.date)
        tfSaat.text = alinanSaat
    }
}

