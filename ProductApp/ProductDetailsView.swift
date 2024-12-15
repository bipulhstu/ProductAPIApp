//
//  ProductDetailsView.swift
//  ProductApp-SwiftUI
//
//  Created by Bipul Islam on 15/12/24.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: Product
    
    var body: some View {
        VStack (spacing: 16) {
            AsyncImageView(imageURL: product.image)
                .scaledToFit()
                .frame(height: 300)
            
            Text(product.title)
                .font(.headline)
            
            Text(product.description)
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            
            //Ratings
            RatingView(rating: product.rating.rate.toString())
            
            Spacer()
            
            HStack{
                VStack(alignment: .leading, spacing: 8){
                    Text("Total Price")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text(product.price.currencyFormat())
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.indigo)
                }
                .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Image(systemName: "cart.fill.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .frame(width: 50, height: 50)
                        .background(.indigo)
                    
                    Text("Buy Now")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(width: 100, height: 50)
                        .background(Color(UIColor.darkGray))
                }
                .cornerRadius(15)
                .foregroundColor(.white)
                //.padding(.horizontal)
                .padding(.trailing)
                
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.2))
            .clipShape(.buttonBorder)
            
            //Spacer()
        }
        .padding()
    }

}

#Preview {
    ProductDetailsView(product: Product.dummy)
}

struct RatingView: View {
    let rating: String
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                
                Text(rating + " " + "Ratings")
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            circleImage
            
            Text("4.6k Reviews")
            
            Spacer()
            
            circleImage
            
            Text("4.6k Sold")
            
        }
        .foregroundStyle(.secondary)
        .font(.callout)
    }
    
    var circleImage: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 8, height: 8)
    }
}
