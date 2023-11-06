//
//  ContentView.swift
//  IngresseProojeto
//
//  Created by LucasLanferdini on 06/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            EventosView()
                .tabItem{
                    Label("Eventos", systemImage: "movieclapper")
                }
            
            PerfilView()
              .tabItem{
                    Label("Perfil", systemImage: "person.crop.rectangle.stack")
                }
            //BuscaView()
              //  .tabItem{
                   // Label("Busca", systemImage: '
              //  }
            //PerfilView()
              //          .tabItem{
                  //          Label("Perfil", systemImage: "Person")
                //        }
            
            
        }
      
    }
}

#Preview {
    ContentView()
}
