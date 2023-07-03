//
//  ContentView.swift
//  bookify
//
//  Created by Gabriel on 30/06/23.
//

import SwiftUI


struct LoginView: View {
    @State private var phoneNumber: String = ""
    @State private var password: String = ""
    @State private var isAnimating: Bool = false
    @State private var isKeyboardVisible: Bool = false
    @State private var isShowingHomeView = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Get back in the\nbarber")
                        .font(.system(size: 44))
                        .fontWeight(.bold)
                        .padding(.vertical, 20)
                        .padding(.top, 30)
                    Spacer()
                }
                
                Spacer()
                
                VStack(spacing: 20) {
                    TextField("Phone Number", text: $phoneNumber)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                .animation(.spring())
                .onTapGesture {
                    // Fechar o teclado ao tocar fora dos campos de texto
                    endEditing()
                }
                
                NavigationLink(destination: HomeView(), isActive: $isShowingHomeView) {
                    EmptyView()
                }
                .hidden()
                
                Button(action: {
                    // Perform login action
                    isShowingHomeView = true // Definir a variável de estado como true para ativar a navegação
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .shadow(color: .accentColor.opacity(0.3), radius: 10, x: 0, y: 5)
                        .scaleEffect(isAnimating ? 1.0 : 0.9)
                        .animation(.spring())
                }
                .padding(.top, 30)
                
                Spacer() // Espaço flexível para empurrar o conteúdo para o topo
                
                if !isKeyboardVisible {
                    VStack {
                        Button(action: {
                            // Perform action for "Criar nova conta"
                        }) {
                            Text("Criar nova conta")
                                .foregroundColor(.accentColor)
                                .font(.headline)
                                .padding(.bottom, 5)
                                .scaleEffect(isAnimating ? 1.0 : 0.9)
                                .animation(.spring())
                        }
                        
                        Button(action: {
                            // Perform action for "Recuperar senha"
                        }) {
                            Text("Recuperar senha")
                                .foregroundColor(.gray)
                                .font(.headline)
                                
                                .scaleEffect(isAnimating ? 1.0 : 0.9)
                                .animation(.spring())
                        }
                    }
                    .background(Color.clear)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 30) // Adiciona espaçamento abaixo dos botões
                }
            }
            .padding()
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            isAnimating = true
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                isKeyboardVisible = true
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                isKeyboardVisible = false
            }
        }
    }
    
    private func endEditing() {
        // Fechar o teclado
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
