//
//  TodosView.swift
//  IngresseProojeto
//
//  Created by LucasLanferdini on 06/11/23.
//

import SwiftUI

struct Todos: Identifiable{
    
    var id = UUID()
    var foto: String
    var nome: String
    var data: String
    var local: String
    
}
struct Localtodos: View{
    var body: some View{
        HStack{
            Text("Todos os Eventos")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
         Spacer()
            
        }.padding(.leading)
    }
}


struct TodosList: View{
    var todos: Todos
    var body: some View{
        ZStack{

            Image(todos.foto)
                .resizable()
                .scaledToFill()
                .frame(width: 380, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 16), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
            VStack{
                Spacer()
            ZStack{
                
                
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .frame(width: 380, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 16), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)


                VStack(alignment: .leading){
                    Text(todos.nome)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(.white)
                        .lineLimit(1)
                        .padding([.bottom], 5)
                    Text(todos.data)
                        .foregroundStyle(.gray)
                        .font(.system(size: 18))
                    Text(todos.local)
                        .foregroundStyle(.gray)
                        .font(.system(size: 18))
                } .padding()
            }
        }
            
        }.padding([.leading])
        
    }
    struct VisualEffectView: UIViewRepresentable {
        var effect: UIVisualEffect?
        func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
        func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
    }
    
    
}



struct TodosView: View {
    
    var todoss: [Todos] = [Todos(foto: "priv", nome: "Réveillon Privilège 2024", data: "Dom., 31 Dez. 22:00", local: "Xangri-la"), Todos(foto: "galeria", nome: "Eu NUNCA Fui em um Baile Funk", data: "Hoje: 23:00", local: "Av. Independencia")]
    
    
    var body: some View {
        VStack{
            Localtodos()

            NavigationStack(){
                List {
                    
                    ForEach(todoss){todoEven in
                        
                        
                        
                        NavigationLink {
                            CallSheet()
                        } label: {
                            TodosList(todos: todoEven)
                        }
                        
                        
                        
                        
                    }
                    
                    
                    .listRowSeparator(.hidden)
                    
                    
                }.listStyle(.plain)
            }
        }
    }
}

#Preview {
    TodosView()
}
