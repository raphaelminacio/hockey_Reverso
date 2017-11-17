//==================
import Foundation

import UIKit
//==================

class AddWords: UIViewController {

    

    
    //-----------
    
    @IBOutlet weak var fr: UITextField!
    @IBOutlet weak var en: UITextField!
    
    
    let userDefaults = UserDefaultsManager()
    
    var arrFrench: [String]!
    var arrEnglish: [String]!
    var dictOfTerms: [String: String]!
    var keys: [String]!
    
    //-----------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manageUser()
    }
    
    @IBAction func add_button(_ sender: UIButton) {
        arrFrench.append(fr.text!)
        arrEnglish.append(en.text!)
        UserDefaults.standard.set(arrFrench, forKey: "french")
        UserDefaults.standard.set(arrEnglish, forKey: "english")
    }
    
    func manageUser() {
        if userDefaults.doesKeyExist(theKey: "french") {
            arrFrench = userDefaults.getValue(theKey: "french") as! [String]
            arrEnglish = userDefaults.getValue(theKey: "english") as! [String]
        } else {
            arrFrench = [String]()
            arrEnglish = [String]()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func selectLanguage(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            fr.placeholder = "Entrer le terme en français"
            en.placeholder = "Entrer traduction en anglais"
        } else {
            fr.placeholder = "Enter french term"
            en.placeholder = "Enter english translation"
        }
        

    }
    
    
}
