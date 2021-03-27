//
//  ViewController.swift
//  LoginFirebase
//
//  Created by Patricia dos Santos Cardozo on 27/03/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var auth:Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
    }

    func alert(title: String, message: String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        
        self.auth?.signIn(withEmail: email, password: password, completion: { (usuario, error) in
            if error != nil{
                self.alert(title: "Atenção", message: "Dados incorretos!")
            } else{
                
                if usuario == nil{
                    self.alert(title: "Atenção", message: "Tivemos um problema inesperado!")
                } else{
                    self.alert(title: "Parabéns", message: "Login feito com sucesso!")
                }
                
            }
        })
    }
    
    @IBAction func registerButton(_ sender: Any) {
        self.performSegue(withIdentifier: "RegisterViewController", sender: nil)
    }
}

