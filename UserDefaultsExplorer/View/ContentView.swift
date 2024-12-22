//
//  ContentView.swift
//  UserDefaultsExplorer
//
//  Created by Kennedy Karimi on 20/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    private let userDefaults: UserDefaults = UserDefaults.standard
    @State private var greeting: String = ""
    
    private let udCredentials: UserDefaults? = UserDefaults.init(suiteName: "com.userdefaultsexplorer.CREDENTIALS") //User defaults object initialized with the defaults for the specific database name.
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Button {
                userDefaults.set("Hello World", forKey: "greeting")
            } label: {
                Text("Save to Standard User Defaults")
            }
            
            Text("Standard User Defaults:\(greeting)")
            
            Button {
                guard let greeting: String = userDefaults.string(forKey: "greeting") else { return }
                self.greeting = greeting
            } label: {
                Text("Get from Standard User Defaults")
            }
            .padding(.bottom, 50)
            
            Button {
                guard let udCredentials: UserDefaults = udCredentials else { return }
                udCredentials.set("jondoe@gmail.com", forKey: "email")
                udCredentials.set("doepwd16", forKey: "password")
            } label: {
                Text("Save to Specific DB Name User Defaults")
            }
            
            Text("DB Named User Defaults:\nEmail: \(email)\nPassword: \(password)")
            
            Button {
                if let udCredentials: UserDefaults = udCredentials, let email: String = udCredentials.string(forKey: "email"), let password: String = udCredentials.string(forKey: "password") { //Instead of having to do udCredentials?.string(forKey:), we unwrap the optional first which then allows us to use udCredentials.string(forKey:)
                    self.email = email
                    self.password = password
                }
            } label: {
                Text("Get from Speicifc DB Name User Defaults")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
