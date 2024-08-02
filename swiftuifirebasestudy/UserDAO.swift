//
//  UserDAO.swift
//  swiftuifirebasestudy
//
//  Created by kenan on 2.08.2024.
//

import Foundation
import Firebase


class UserDAO{
    var refUsers = Database.database().reference().child("users")
    
    func saveUser(user_name:String,user_age:Int){
        let newUser = ["kisi_ad":user_name,"user_age":user_age] as [String:Any]
        refUsers.childByAutoId().setValue(newUser)
    }
    
    func getAllUsers(){
        refUsers.observe(.value, with: { snapshot in
        var userList = [Kisiler]()
            
            if let datas = snapshot.value as? [String:AnyObject]{
                for row in datas{
                    if let data = row.value as? NSDictionary{
                        let user_name = data["kisi_ad"] as? String ?? ""
                        let user_age = data["kisi_age"] as? Int ?? 0
                        
                        let user = Kisiler( kisi_ad: user_name, kisi_yas:user_age)
                        userList.append(user)
                    }
                }
            }
            for user in userList{
                print("-------------------")
                print("User Name: \(user.kisi_ad!)")
                print("User Age: \(user.kisi_yas!)")
            }
        })
    }
    
    func removeUser(key:String){
        refUsers.child(key).removeValue()
    }
    
    func updateUser(key:String,user_name:String,user_age:Int){
        let updatedUser = ["kisi_ad":user_name,"kisi_yas":user_age] as [String:Any]
        refUsers.child(key).updateChildValues(updatedUser)
    }
    
    func equal(wordToBeSearched:String){
        let query = refUsers.queryOrdered(byChild: "kisi_ad").queryEqual(toValue: wordToBeSearched)
        
        
        query.observe(.value, with: { snapshot in
        var userList = [Kisiler]()
            
            if let datas = snapshot.value as? [String:AnyObject]{
                for row in datas{
                    if let data = row.value as? NSDictionary{
                        let user_name = data["kisi_ad"] as? String ?? ""
                        let user_age = data["kisi_age"] as? Int ?? 0
                        
                        let user = Kisiler( kisi_ad: user_name, kisi_yas:user_age)
                        userList.append(user)
                    }
                }
            }
            for user in userList{
                print("-------------------")
                print("User Name: \(user.kisi_ad!)")
                print("User Age: \(user.kisi_yas!)")
            }
        })
    }
    
    func degerAraligi(){
        let sorgu = refUsers.queryOrdered(byChild: "kisi_yas").queryStarting(atValue: 10).queryEnding(atValue: 40)
        
        sorgu.observe(.value, with: { snapshot in
            var liste = [Kisiler]()
            
            if let gelenVeri = snapshot.value as? [String:AnyObject] {
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary {
                        let kisi_ad = d["kisi_ad"] as? String ?? ""
                        let kisi_yas = d["kisi_yas"] as? Int ?? 0
                        
                        let kisi = Kisiler(kisi_ad: kisi_ad, kisi_yas: kisi_yas)
                        liste.append(kisi)
                    }
                }
            }
            
            for k in liste {
                print("--------------------")
                print("Kişi Ad  : \(k.kisi_ad!)")
                print("Kişi Yaş : \(k.kisi_yas!)")
            }
        })
    }
    
    
    func limit(){
        let sorgu = refUsers.queryLimited(toFirst: 2)
        
        sorgu.observe(.value, with: { snapshot in
            var liste = [Kisiler]()
            
            if let gelenVeri = snapshot.value as? [String:AnyObject] {
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary {
                        let kisi_ad = d["kisi_ad"] as? String ?? ""
                        let kisi_yas = d["kisi_yas"] as? Int ?? 0
                        
                        let kisi = Kisiler(kisi_ad: kisi_ad, kisi_yas: kisi_yas)
                        liste.append(kisi)
                    }
                }
            }
            
            for k in liste {
                print("--------------------")
                print("Kişi Ad  : \(k.kisi_ad!)")
                print("Kişi Yaş : \(k.kisi_yas!)")
            }
        })
    }
    
    
}
