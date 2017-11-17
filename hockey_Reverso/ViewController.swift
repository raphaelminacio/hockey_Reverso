import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //-------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFrench.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        keys = [String](dictOfTerms.keys)
        cell.textLabel?.text = keys[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        translatedWord.text = dictOfTerms[keys[indexPath.row]]
        
    }
    //-------------
    @IBOutlet weak var originLanguage: UILabel!
    @IBOutlet weak var destinyLanguage: UILabel!
    @IBOutlet weak var translatedWord: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabTitleSearch: UITabBarItem!
    
    let userDefaults = UserDefaultsManager()
    
    var arrFrench: [String]!
    var arrEnglish: [String]!
    var dictOfTerms: [String: String]!
    var keys: [String]!
    
    
    
    
    //-------------
    override func viewDidLoad() {
        super.viewDidLoad()
        manageUser()
        
        
        
        if originLanguage?.text == "Français" {
            dictOfTerms = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
        } else {
            dictOfTerms = Dictionary(uniqueKeysWithValues: zip(arrEnglish, arrFrench))
        }
            
    }

    //------------- 

    @IBAction func translateButton(_ sender: UIButton) {
        if originLanguage?.text == "Français" {
            originLanguage?.text = "English"
            destinyLanguage?.text = "Français"
            tabTitleSearch.title = "Search"
            dictOfTerms = Dictionary(uniqueKeysWithValues: zip(arrEnglish, arrFrench))
            
        } else {
            originLanguage?.text = "Français"
            destinyLanguage?.text = "English"
            tabTitleSearch.title = "Recherche"
            dictOfTerms = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
            
        }
        tableView.reloadData()
        translatedWord.text = ""
        
        
    }
    
    //-------------
    
    func manageUser() {
        if userDefaults.doesKeyExist(theKey: "french") {
            arrFrench = userDefaults.getValue(theKey: "french") as! [String]
            arrEnglish = userDefaults.getValue(theKey: "english") as! [String]
        } else {
            arrFrench = [String]()
            arrEnglish = [String]()
        }
    }
    
    //-------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}



