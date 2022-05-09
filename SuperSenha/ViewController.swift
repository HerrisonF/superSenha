//
//  ViewController.swift
//  SuperSenha
//
//  Created by Herrison Feres on 06/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumerOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordViewController = segue.destination as! PasswordViewController
        
        if let numberOfPassword = Int(tfTotalPasswords.text!){
            passwordViewController.numberOfPasswords = numberOfPassword
        }
        
        if let numberOfCharacters = Int(tfNumerOfCharacters.text!){
            passwordViewController.numberOfCharacters = numberOfCharacters
        }
        
        passwordViewController.useLetters = swLetters.isOn
        passwordViewController.useNumbers = swNumbers.isOn
        passwordViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordViewController.useSpecialCharacters = swSpecialCharacters.isOn
        
        ///Força o encerramente para qualquer textField perder o foco e o teclado fechar
        view.endEditing(true)
    }


}

