//
//  EventosView.swift
//  IngresseProojeto
//
//  Created by LucasLanferdini on 06/11/23.
//

import SwiftUI

struct EventoHoriz: Identifiable {
    var id = UUID()
    var foto: String
}
struct Evento: Identifiable {
    var id = UUID()
    var foto: String
    var name: String
    var data: String
    var horario: String
    var type: Int
    var liked: Bool = false
}

struct imaHori: View {
    var eventoHoriz: EventoHoriz
    
    var body: some View {
        Image(eventoHoriz.foto)
            .resizable()
            .scaledToFit()
            .frame(width: 325, height: 125)
            .clipShape(RoundedRectangle(cornerRadius: 12), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
    }
}
struct Local: View{
    var body: some View{
        HStack{
            Text("Rio Grande do Sul")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            Spacer()
            Text("Trocar")
                .onTapGesture{
                    
                    
                }
        }.padding()
    }
}
struct TrocarLugar: View{
    var body: some View{
        Text("Text")
    }
}
struct EventoList: View{
    
    var evento: Evento
    
    var body: some View{
        
        VStack(){
            Image(evento.foto)
                .resizable()
                .frame(width:125, height:175)
                .clipShape(RoundedRectangle(cornerRadius:5), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                .scaledToFit()
            Text(evento.name)
                .frame(width:125)
                .lineLimit(1)
                .font(.system(size: 15))
                .foregroundStyle(.black)
                .bold()
            HStack{
                Text(evento.data)
                Text(evento.horario)
            }.font(.system(size: 13))
                .foregroundStyle(.orange)
                .bold()
            
            
        }
        
    }
    
    
}


struct EventosView: View {
    
    
    
    @State var eventos: [Evento] = [Evento(foto: "halloween", name: "Halloween PARK", data: "Hoje", horario: "21:00", type: 1), Evento(foto: "galeria", name: "Eu NUNCA Fui em um Baile Funk", data: "Hoje", horario: "23:00", type: 1), Evento(foto: "moa", name: "Pré-Feriado no MOA", data: "Hoje", horario: "23:30", type: 2), Evento(foto: "oktob", name: "Oktober Fest", data: "03 Nov.,", horario: "18:00", type: 2), Evento(foto: "livro 1", name: "Feira do livro POA", data: "27 Out., - 15 Nov.,", horario: "9:00", type: 3),Evento(foto: "rev 1", name: "Oito Atlantida", data: "2024", horario: "23:30", type:4), Evento(foto: "priv", name: "Réveillon Privilège", data: "31 dez", horario: "22:00", type: 4)]
    
    @State var eventosHoriz: [EventoHoriz] =  [EventoHoriz(foto:"Livro"),EventoHoriz(foto:"Vorazes")]
    
    @State var isPresented1: Bool = false
    @State var isPresented2: Bool = false
    @State var isPresented3: Bool = false
    @State var isPresented4: Bool = false
    @State var isPresented5: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading){
                Local()
                
                List{
                    ScrollView (.horizontal){
                        HStack {
                            ForEach(eventosHoriz) { eventoHoriz in
                                imaHori(eventoHoriz: eventoHoriz)
                                
                            }.padding()
                                .listRowSeparator(.hidden, edges: .top)
                        }
                        
                    }
                    
                    
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        
                        Text("Próximos eventos")
                            .font(.title3)
                            .lineLimit(1)
                            .bold()
                        Spacer()
                        Button("VER TODOS"){
                            print("TESTE")
                            self.isPresented1 = true
                        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                    .navigationDestination(isPresented: $isPresented1, destination: { TodosView()})
                    
                    ScrollView (.horizontal){
                        HStack {
                            ForEach(eventos) { evento in
                                NavigationLink {
                                    CallSheet()
                                } label: {
                                    EventoList(evento: evento)
                                }
                            }
                            
                        }
                        
                    }
                    
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        
                        Text("Festa e balada")
                            .font(.title3)
                            .lineLimit(1)
                            .bold()
                        Spacer()
                        Button("VER TODOS"){
                            print("TESTE")
                            self.isPresented2 = true
                        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }.navigationDestination(isPresented: $isPresented2, destination: {TodosView()})
                    
                    ScrollView (.horizontal){
                        HStack {
                            ForEach(eventos) { evento in
                                
                                if evento.type == 1{
                                    NavigationLink {
                                        CallSheet()
                                    } label: {
                                        EventoList(evento: evento)
                                    }
                                }
                                
                            }
                        }
                        
                    }
                    
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        
                        Text("Show e festivais")
                            .font(.title3)
                            .lineLimit(1)
                            .bold()
                        Spacer()
                        Button("VER TODOS"){
                            print("TESTE")
                            self.isPresented3 = true
                        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }.navigationDestination(isPresented: $isPresented3, destination: {TodosView()})
                    
                    ScrollView (.horizontal){
                        HStack {
                            ForEach(eventos) { evento in
                                if evento.type == 2{
                                    NavigationLink {
                                        CallSheet()
                                    } label: {
                                        EventoList(evento: evento)
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        
                        Text("Cultura")
                            .font(.title3)
                            .lineLimit(1)
                            .bold()
                        Spacer()
                        Button("VER TODOS"){
                            print("TESTE")
                            self.isPresented4 = true
                        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }.navigationDestination(isPresented: $isPresented4, destination: {TodosView()})
                    
                    ScrollView (.horizontal){
                        HStack {
                            ForEach(eventos) { evento in
                                if evento.type == 3 {
                                    NavigationLink {
                                        CallSheet()
                                    } label: {
                                        EventoList(evento: evento)
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        
                        Text("Réveillon")
                            .font(.title3)
                            .lineLimit(1)
                            .bold()
                        Spacer()
                        Button("VER TODOS"){
                            print("TESTE")
                            self.isPresented5 = true
                        }.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }.navigationDestination(isPresented: $isPresented5, destination: {TodosView()})
                    
                    ScrollView (.horizontal){
                        HStack {
                            ForEach(eventos) { evento in
                                if evento.type == 4{
                                    NavigationLink {
                                        CallSheet()
                                    } label: {
                                        EventoList(evento: evento)
                                    }
                                }
                                
                            }
                            .listRowSeparator(.hidden)
                        }
                        
                    }
                    
                    .listRowSeparator(.hidden)
                    
                    Image("apple")
                        .resizable()
                        .frame(width: 360, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 5), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                        .scaledToFit()
                    
                    
                        .listRowSeparator(.hidden)
                    
                }.listStyle(.plain)
                    .listRowSeparator(.hidden)
                
            }
        }
    }
}

#Preview {
    EventosView()
}
