//
//  Product_DB.swift
//  MOMMA
//
//  Created by OctopusPro Developer on 29/12/2022.
//

import UIKit
import CoreData

// Sagve data coreData
    var app_delegate = UIApplication.shared.delegate as! AppDelegate
    var db_context  = app_delegate.persistentContainer.viewContext


extension UIViewController {
    
    
    func  LoadProducts () -> [Product_Entity]
    
    {
        let request : NSFetchRequest <Product_Entity> =
        Product_Entity.fetchRequest()
        
        do {
            let items :[ Product_Entity] =   try db_context.fetch(request)
            
            return items
        }catch  {
            print("Data Fetched Error  ")
        }
        
    return   [Product_Entity]()
    }
    
    
    func  getCountProducts () -> Int
    
    {
        let request : NSFetchRequest <Product_Entity> =
        Product_Entity.fetchRequest()
        
        do {
            let items :[ Product_Entity] =   try db_context.fetch(request)
            
            return items.count
        }catch  {
            print("Data Fetched Error  ")
        }
        
    return  0
    }
    
    
    
    func deleteProduct (index : Int) {
        
      
        let request : NSFetchRequest <Product_Entity> =
        Product_Entity.fetchRequest()
        
        do {
            let items :[ Product_Entity] =   try db_context.fetch(request)
            let deleted_item   =  items[index]
            db_context.delete(deleted_item)
        }catch  {
            print("Data Fetched Error  ")
        }
    }
    
    
    
    func clearAllProducts () {
        
        let request : NSFetchRequest <NSFetchRequestResult> =
        Product_Entity.fetchRequest()
        
      let request_delete =   NSBatchDeleteRequest(fetchRequest: request)
        do {
            try   db_context.execute(request_delete)
            print ("Clear Succeassfully")
        } catch {
            
            print("Data Patched Error  ")
        }
    }
    
    
    func EditProducts (product : Product) {
        
        let request : NSFetchRequest <Product_Entity> =
        Product_Entity.fetchRequest()
        request.predicate = NSPredicate(format: "id=%d", Int16( product.id) )
        do {
         let object =   try   db_context.fetch(request).first
            object?.name = product.title
            object?.category = product.category
            
            print ("Clear Succeassfully")
        } catch {
            
            print("Data Patched Error  ")
        }
    }
    

    
    
}

