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
            
            List(viewModel.products){ product in
                ProductRowView(product: product)
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
