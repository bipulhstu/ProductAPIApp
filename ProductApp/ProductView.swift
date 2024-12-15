//
//  ProductView.swift
//  ProductApp
//
//  Created by Bipul Islam on 14/12/24.
//

import SwiftUI

struct ProductView: View {
    
    var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack {
            
            //List(viewModel.products){ product in
            List{
                ForEach(Array(viewModel.products.enumerated()), id: \.element.id){ index, product in
                    NavigationLink {
                        //Destination
                        ProductDetailsView(products: viewModel.products, index: index)
                    } label: {
                        //UI
                        ProductRowView(product: product)
                    }
                }
                
            }
            .listStyle(.plain)
            .navigationTitle("Product")
        }
        .task{
            await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductView()
}
