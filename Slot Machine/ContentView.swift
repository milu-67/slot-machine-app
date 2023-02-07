//
//  ContentView.swift
//  Slot Machine
//
//  Created by Milan Vadgama on 21/01/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var Winning_amount = 0
    private var fruits = ["apple","star-512","cherry"]
    @State private var initials = [2 ,1 ,0]
    @State private var credits = 100
    //let bet =  ["10","20","50","100"]
    @State private var bet = 50
    @State private var buttondisabled: Bool = false
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(Color(red: 150/255, green: 250/255, blue: 250/255))
                .edgesIgnoringSafeArea(.all)
            
            Ellipse()
                .foregroundColor(Color(red: 2500/255, green: 50/255, blue: 170/255))
                .frame(width: 1000, height: 300)
                .rotationEffect(Angle(degrees: 135))
            
            VStack {
                
                //padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                
                HStack{
                    Image(systemName: "dollarsign.circle")
                    //.foregroundColor(Color(red: 2500/255, green: 50/255, blue: 170/255))
                        .bold()
                    
                    
                    Text("Slot Machine")
                        .bold()
                    
                    Image(systemName: "dollarsign.circle")
                    //.foregroundColor(Color(red: 2500/255, green: 50/255, blue: 170/255))
                        .bold()
                }.scaleEffect(2)
                
                Spacer()
                
                HStack{
                    Text("Credits: " + "$" + String(credits))
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .bold()
                        .padding()
                        .background(Color.black.gradient)
                        .cornerRadius(25)
                    
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 20, trailing: 5))
                    
                    Text("Winnings: " + "$" + String(Winning_amount))
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .bold()
                        .padding()
                        .background(Color.black.gradient)
                        .cornerRadius(25)
                    
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 20, trailing: 5))
                }
                
                HStack{
                    
                    Spacer(minLength: 260)
                    
                    Image(fruits[initials[0]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(1))
                        .cornerRadius(20)
                    
                    Image(fruits[initials[1]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(1))
                        .cornerRadius(20)
                    
                    Image(fruits[initials[2]])
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(Color.white.opacity(1))
                        .cornerRadius(20)
                    
                    
                    Spacer(minLength: 260)
                }
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 20, trailing: 30))
                
                HStack{
                    
                    Button(action:{
                        //todo
                        
                    }) {
                        Text("10")
                            .foregroundColor(.black)
                            .fixedSize()
                            .font(.system(size: 40))
                            .bold()
                            .padding(15)
                        
                    }
                    
                    Button(action:{
                        //String(credits) = String(credits) - String(bet[1])
                    }) {
                        Text("20")
                            .foregroundColor(.black)
                            .fixedSize()
                            .font(.system(size: 40))
                            .bold()
                            .padding(15)
                        
                    }
                    
                    Button(action:{
                        //String(credits) = String(credits) - String(bet[2])
                    }) {
                        Text("50")
                            .foregroundColor(.black)
                            .fixedSize()
                            .font(.system(size: 40))
                            .bold()
                            .padding(15)
                        
                    }
                    
                    Button(action:{
                        //String(credits) = String(credits) - String(bet[3])
                    }) {
                        Text("100")
                            .foregroundColor(.black)
                            .fixedSize()
                            .font(.system(size: 40))
                            .bold()
                            .padding(15)
                        
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 20, trailing: 30))
                
                Spacer()
                
                //adding buttons spin, reset and quit and action to be completed when pressed
                HStack{
                    
                    Button(action:{
                        self.credits = 100
                        self.Winning_amount = 0
                        self.bet = 100
                        buttondisabled = false
                    }) {
                        Text("Reset")
                            .foregroundColor(.white)
                            .fixedSize()
                            .font(.system(size: 25))
                            .bold()
                            .padding(15)
                            .padding([.leading , .trailing])
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    
                    Button(action:{
                        
                        //image randomization
                        self.initials[0] = Int.random(in: 0...self.fruits.count - 1)
                        self.initials[1] = Int.random(in: 0...self.fruits.count - 1)
                        self.initials[2] = Int.random(in: 0...self.fruits.count - 1)
                        
                        //checking if winning numbers
                        if (self.initials[0] == self.initials[1] && self.initials[1] == self.initials[2])
                        {
                            self.Winning_amount += bet * 10
                            self.credits = credits + 100
                        }
                        
                        else
                        {
                            if(self.credits<50)
                            {
                                buttondisabled = true;
                            }
                            else
                            {
                                self.credits = credits - 50
                            }
                        }
                        
                    }) {
                        
                        Text("Spin")
                            .foregroundColor(.white)
                            .fixedSize()
                            .font(.system(size: 25))
                            .bold()
                            .padding(15)
                            .padding([.leading , .trailing], 20)
                            .background(Color.black)
                            .cornerRadius(10)
                    }.disabled(buttondisabled == true)
                    
                    Button(action:{
                        //todo
                    }) {
                        Text("Quit")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .bold()
                            .padding(15)
                            .padding([.leading , .trailing], 20)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                }
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
