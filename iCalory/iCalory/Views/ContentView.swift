//
//  ContentView.swift
//  iCalory
//
//  Created by sergio joel camacho zarco on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food : FetchedResults<Food>
    // fetch by data, order it by date, the most recent at tthe beginning
    @State private var showingAddView = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Text("\(Int(totalCaloriesToday())) Kcal today")
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                List{
                    ForEach(food){food in
                        NavigationLink(destination : Text("\(food.calories)")){
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(food.name!)
                                        .bold()
                                    Text("\(Int(food.calories))") + Text(" calories").foregroundColor(.pink)
                                    Spacer()
                                    Text(getTimeSince(date: food.date!))
                                        .foregroundColor(.secondary)
                                        .italic()
                                }
                            } //hs
                        } // nvLink
                    } //frch
                    .onDelete(perform: deleteFood)
                } //ls
                .listStyle(.plain)
            } //vs
            .navigationTitle("iCalories")
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showingAddView.toggle()
                    }label: {
                        Label("Add Meal", systemImage: "plus.circle")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading ){
                    EditButton()
                }
            } // tool
            .sheet(isPresented: $showingAddView) {
                AddFoodView()
            }
        } // nav
        .navigationViewStyle(.stack) // will be deprecated
    }
    
    private func deleteFood(offsets : IndexSet){
        withAnimation {
            offsets.map{ food[$0] }.forEach(managedObjectContext.delete)
            DataController().save(context: managedObjectContext)
        }
    }
    private func totalCaloriesToday() -> Double{
        var caloriesToday : Double = 0.0
        for item in food{
            if(Calendar.current.isDateInToday(item.date!)){
                caloriesToday += item.calories
            }
        }
        return caloriesToday
    }
}
