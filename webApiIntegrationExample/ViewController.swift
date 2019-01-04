//
//  ViewController.swift
//  webApiIntegrationExample
//
//  Created by Mac on 04/01/19.
//  Copyright © 2019 Bhadresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtEmailId: UITextField!
    
    @IBOutlet weak var txtUserName: UITextField!
    
    
    @IBOutlet weak var txtMobileNumber: UITextField!
    
    @IBOutlet weak var txtCountryName: UITextField!
    
    var url_string = "https://yourpocket.000webhostapp.com/students/"
    var url:URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SignUpAction(_ sender: UIBarButtonItem) {
        
        url = URL(string:url_string+"registration.php")
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        let postStr = "rname=\(txtUserName.text!)&mob=\(txtMobileNumber.text!)&cname=\(txtCountryName.text!)&eid=\(txtEmailId.text!)"
        print(postStr)
        urlRequest.httpBody = postStr.data(using: .utf8)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { (data, res, err) in
            
            if err != nil{
                print("Error:\(err?.localizedDescription)")
            }
            else{
                do{
                    
                    let resultDict = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String:Any]
                    
                    if resultDict["Error"] != nil{
                        //print("Error")
                        
                        let alertView = UIAlertController(title: "Error", message: "Error: \(resultDict["Error"]!)", preferredStyle: .alert)
                        
                        let alertActionOk = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
                        
                        alertView.addAction(alertActionOk)
                        
                        DispatchQueue.main.async {
                            self.present(alertView, animated: true, completion: nil)
                        }
                        
                        
                    }
                    else
                    {
                        let alertView = UIAlertController(title: "Message", message: "Message: \(resultDict["Message"]!)", preferredStyle: .alert)
                        
                        let alertActionOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        
                        alertView.addAction(alertActionOk)
                        
                        DispatchQueue.main.async {
                            self.present(alertView, animated: true, completion: nil)
                        }
                    }
                    
                }
                catch{
                    print("Error in Covert data!")
                }
            }
        }
        
        dataTask.resume()
        
    }
    
    
    @IBAction func SignInAction(_ sender: UIBarButtonItem) {
        
        url = URL(string:url_string+"login")
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        let postStr = "pass=\(txtPassword.text!)&eid=\(txtEmailId.text!)"
        print(postStr)
        urlRequest.httpBody = postStr.data(using: .utf8)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { (data, res, err) in
            
            if err != nil{
                print("Error:\(err?.localizedDescription)")
            }
            else{
                do{
                    
                    let resultDict = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String:Any]
                    
                    if resultDict["Error"] != nil{
                        //print("Error")
                        
                        let alertView = UIAlertController(title: "Error", message: "Error: \(resultDict["Error"]!)", preferredStyle: .alert)
                        
                        let alertActionOk = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
                        
                        alertView.addAction(alertActionOk)
                        
                        DispatchQueue.main.async {
                            self.present(alertView, animated: true, completion: nil)
                        }
                        
                        
                    }
                    else
                    {
                        let alertView = UIAlertController(title: "Message", message: "Message: \(resultDict["Message"]!)", preferredStyle: .alert)
                        
                        let alertActionOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        
                        alertView.addAction(alertActionOk)
                        
                        DispatchQueue.main.async {
                            self.present(alertView, animated: true, completion: nil)
                        }
                    }
                    
                }
                catch{
                    print("Error in Covert data!")
                }
            }
        }
        
        dataTask.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

