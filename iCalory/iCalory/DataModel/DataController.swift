//
//  DataController.swift
//  iCalory
//
//  Created by sergio joel camacho zarco on 17/07/23.
//

import Foundation
import CoreData

class DataController : ObservableObject{
    let container = NSPersistentContainer(name: "FoodModel")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    } //init
    
    func save(context : NSManagedObjectContext){
        do{
            try context.save()
            print("saved successfully")
        }
        catch{
            print("Failed to save \(error.localizedDescription)")
        }
    }
    
    func addFood(name : String, calories : Double, context : NSManagedObjectContext){
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
    
    func editFood(food : Food, name : String, calories : Double, context : NSManagedObjectContext){
        food.date = Date()
        food.name = name
        food.calories = calories
        
        save(context: context)
    }
}
