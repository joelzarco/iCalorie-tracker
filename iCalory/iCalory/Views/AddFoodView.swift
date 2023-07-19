//
//  AddFoodView.swift
//  iCalory
//
//  Created by sergio joel camacho zarco on 18/07/23.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories : Double = 0.0
    
    var body: some View {
        Form{
            Section{
                TextField("What did you eat?", text: $name)
                
                VStack{
                    Text("How much calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        DataController().addFood(name: name, calories: calories, context: managedObjectContext)
                        dismiss()
                    }
                    Spacer()
                } //hs
            } //sec
        } //frm
    }
}
