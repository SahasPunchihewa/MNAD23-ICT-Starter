//
//  CartView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct CartView: View {
    @Binding var shopItems: [ShopItem]
    @State var total = 0.0
    // declare your properties here
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(shopItems.indices, id: \.self) { index in
                        HStack (alignment: .center) {
                            Text(shopItems[index].name)
                            Text("$ \(shopItems[index].price * Double(shopItems[index].quantity), specifier: "%0.2f")")
                        }
                    }
                
                }
                
                Text("Total \(total)")
            }
            .padding()
        }
    }
    
    private func calculatePurchasedItems(item: ShopItem) -> Double {
        return item.price * Double(item.quantity)
    }
    
    private func calculateTotal() {
        
//        for(shopItem in shopItems {
//            total += calculatePurchasedItems(shopItem)
//        })
    }
}

//#Preview {
//    CartView()
//}
