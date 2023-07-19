//
//  EditFoodView.swift
//  iCalory
//
//  Created by sergio joel camacho zarco on 19/07/23.
//

import SwiftUI

struct EditFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    var food : FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var calories : Double = 0
    
    var body: some View {
        Form{
            Section{
                TextField("\(food.name!)", text: $name)
                    .onAppear{ // so user can continue were it was previously
                        name = food.name!
                        calories = food.calories
                    }
                VStack{
                    Text("Calories : \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        DataController().editFood(food: food, name: name, calories: calories, context: managedObjectContext)
                        dismiss()
                    }
                    Spacer()
                }
            } //sc
        } // fmr
    }
}

