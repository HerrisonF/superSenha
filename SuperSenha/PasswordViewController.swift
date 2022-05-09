//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Herrison Feres on 09/05/22.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var tvPassawords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///Esse title é o title da tela, que pode ser modificado via código
        title = "Total de senhas: \(numberOfPasswords)"
        
        passwordGenerator = PasswordGenerator(
            numberOfCharacters: self.numberOfCharacters, useLetters: self.useLetters, useNumbers: self.useNumbers, useCapitalLetters: self.useCapitalLetters, useSpecialCharacters: self.useSpecialCharacters)
        
        generatePasswords()
    }
    
    func generatePasswords () {
        ///Esse scroll faz com que scrolle até o topo do textView
        tvPassawords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        ///
        tvPassawords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPassawords.text.append(password+"\n\n")
        }
    }

    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
}
