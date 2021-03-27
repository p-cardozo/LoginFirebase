//
//  RegisterViewController.swift
//  LoginFirebase
//
//  Created by Patricia dos Santos Cardozo on 27/03/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextFiel: UITextField!
    @IBOutlet weak var passwordTextFiel: UITextField!
    
    var auth: Auth?
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
    
    
    @IBAction func registerButton(_ sender: UIButton){
        
        let email:String = self.emailTextFiel.text ?? ""
        let password:String = self.passwordTextFiel.text ?? "" 
        
        self.auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
            if error != nil {
                self.alert(title: "Atenção", message: "Falha ao cadastrar!")
                print("falha ao cadastrar")
            } else{
                self.alert(title: "Atenção", message: "Sucesso ao cadastrar")
            }
        })
    }

    @IBAction func backButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }

}
