//
//  CallSheet.swift
//  IngresseProojeto
//
//  Created by LucasLanferdini on 06/11/23.
//

import SwiftUI

struct CallSheet: View {
    
    @State private var showingDetail = true
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image("priv")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            //                .frame(width: 400, height: 600)
            //                .padding([.bottom], 280)
            //                .clipShape(RoundedRectangle(cornerRadius: 12), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
            
         
        .sheet(isPresented: $showingDetail) {
            SheetEvento()
                .presentationDetents([.medium, .large])
        }
          

        }
        
        
        
    }
   
}

#Preview {
    CallSheet()
}
