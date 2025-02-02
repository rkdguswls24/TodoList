//
//  NoItemView.swift
//  TodoList
//
//  Created by 강현진 on 2/2/25.
//

import SwiftUI

struct NoItemView: View {
    @State private var animate: Bool = false
    var gradientColor:[Color] = [Color("GradientColor1"),Color("GradientColor2")]
    
    var body: some View {
        ScrollView{
            VStack {
                Image(systemName: "exclamationmark.octagon.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(
                        AngularGradient(gradient: Gradient(colors: gradientColor), center: .leading, angle: .degrees(180))
                    )
                    .frame(width:130,height:200)
                Text("새로운 할일을 적어보세요!🛠️")
                    .font(.title)
                
                NavigationLink(destination: AddView()) {
                    HStack{
                        Text("추가하기")
                        
                        Image(systemName: "plus")
                    }
                    .padding(.vertical,8)
                    .foregroundStyle(Color.secondary)
                    .frame(width: 120)
                    .background(animate ? Color.orange.opacity(0.3) : Color.blue.opacity(0.3),in:Capsule())
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.orange.opacity(0.9) : Color.blue.opacity(0.9),
                    radius: animate ? 30 : 10,
                    x: 0.0,
                    y: animate ? 45 : 28
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .onAppear {
                    addAnimate()
                }
                
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        NoItemView()
            .navigationTitle("title")
    }
}


extension NoItemView {
    func addAnimate() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
}
