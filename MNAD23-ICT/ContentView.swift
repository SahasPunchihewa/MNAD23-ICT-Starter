//
//  ContentView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct ContentView: View {
    // declare your properties here
    
    @State var shopItems = [
        ShopItem(name: "Broccoli", price: 5.00, quantity: 0),
        ShopItem(name: "Banana", price: 5.00, quantity: 0),
        ShopItem(name: "Avocado", price: 5.00, quantity: 0),
        ShopItem(name: "Chicken", price: 5.00, quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 0)
    ]
    
    @State var showCartView = false
    
    let step = 0
    let range = 0...10
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Text("Buy Fresh Groceries")
                
                List {
                    ForEach(shopItems.indices, id: \.self) { index in
                        HStack (alignment: .center) {
                            Image(shopItems[index].name.lowercased())
                                .resizable()
                                .frame(width: 75,height: 75)
                                .aspectRatio(contentMode: .fit)
                                .padding(.trailing)
                                .padding(.leading)
                            
                            VStack(alignment: .leading) {
                                Text(shopItems[index].name)
                                Text("$ \(shopItems[index].price, specifier: "%0.2f")")
                            }
                            
                            Stepper("", value: $shopItems[index].quantity, in: range, step: step)
                            
                            Text("\(step)")
                                .padding(.trailing)
                        }
                    }
                
                }
                
                Spacer()
                
                Button("Checkout") {
                    showCartView.toggle()
                }
            }
            .padding()
            .navigationDestination(isPresented: $showCartView) {
                CartView(shopItems: $shopItems)
            }
        }
    }
}

#Preview {
    ContentView()
}
