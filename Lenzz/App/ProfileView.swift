//
//  ProfileView.swift
//  ShiftPilot1
//
//  Created by Aiden Yang on 2024/4/23.
//

import SwiftUI

struct ProfileView: View {
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var body: some View {
        VStack {
            HStack {
                Text("张三")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
                Avatar(avatarUrlString: "")
            }
            LazyVGrid(columns: columns, content: {
                RectangularButton(icon: "person.fill", text: "订单", width: 100, height: 100)
                RectangularButton(icon: "person.fill", text: "钱包", width: 100, height: 100)
                RectangularButton(icon: "person.fill", text: "活动", width: 100, height: 100)
            })
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
