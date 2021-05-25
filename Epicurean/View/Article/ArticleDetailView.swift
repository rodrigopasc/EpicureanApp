//
//  DetailView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 03/05/2021.
//

import SwiftUI

struct ArticleDetailView: View {
    // MARK: - Properties
    
    @ObservedObject var detail: DetailViewModel
    
    var animation: Namespace.ID
    
    // MARK: - Functions
    
    func closeDetails() {
        detail.reset()
        
        detail.show.toggle()
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    Image(detail.selectedItem.image)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
//                        .matchedGeometryEffect(id: detail.selectedItem.image, in: animation)
                        .frame(width: UIScreen.main.bounds.width)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.75, dampingFraction: 0.725, blendDuration: 0.9)) {
                                closeDetails()
                            }
                        }
                    
                    VStack(alignment: .leading) {
                        Text(detail.selectedItem.title.uppercased())
                            .fontWeight(.semibold)
                            .shadow(color: Color.primary.opacity(0.3), radius: 5)
//                            .matchedGeometryEffect(id: detail.selectedItem.title + detail.selectedItem.footnote, in: animation)
                        
                        Text(detail.selectedItem.subtitle)
                            .font(.title)
                            .fontWeight(.bold)
                            .shadow(color: Color.primary.opacity(0.3), radius: 5)
//                            .matchedGeometryEffect(id: detail.selectedItem.subtitle + detail.selectedItem.footnote, in: animation)

                        Spacer()

                        Text(detail.selectedItem.footnote)
                            .font(.footnote)
                            .shadow(color: Color.primary.opacity(0.3), radius: 5)
//                            .matchedGeometryEffect(id: detail.selectedItem.footnote + detail.selectedItem.title, in: animation)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
                    .minimumScaleFactor(0.05)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.interactiveSpring(response: 0.75, dampingFraction: 0.725, blendDuration: 0.9)) {
                            closeDetails()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.primary.opacity(0.7))
                            .padding()
                            .background(Color.primary.colorInvert().opacity(0.8))
                            .clipShape(Circle())
                            .shadow(color: Color.primary.opacity(0.3), radius: 5)
                    })
                    .padding(.horizontal)
                    .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
                }
                .frame(width: UIScreen.main.bounds.width)
                
                VStack(alignment: .leading) {
                    Text("lifestyle".uppercased())
                        .fontWeight(.semibold)
                    
                    Text("teste mesmo ein!")
                        .font(.title)
                        .fontWeight(.bold)

                    Spacer()
                    Spacer()
                    Spacer()

                    Text("Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum\nLorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum\n\nLorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum\nLorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum\n\nLorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum\nLorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum")
                        .fixedSize(horizontal: false, vertical: true)
                        .font(.footnote)
                }
                .padding()
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .matchedGeometryEffect(id: detail.selectedItem.footnote + detail.selectedItem.title + "box", in: animation)
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

//// MARK: - Preview

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
