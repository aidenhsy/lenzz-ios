//
//  RectangularButton.swift
//  Lenzz
//
//  Created by Aiden Yang on 2024/5/27.
//
import SwiftUI

struct RectangularButton: View {
    // MARK: - PROPERTIES

    let icon: String
    let text: String
    let width: CGFloat
    let height: CGFloat

    // MARK: - BODY

    var body: some View {
        // Add your UI elements here
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .frame(width: width, height: height)
            VStack {
                Image(systemName: icon)
                    .foregroundStyle(.black)
                    .font(.largeTitle)
                Text(text)
                    .font(.caption)
                    .foregroundStyle(.black)
                    .padding(.top, 2)
            }
        }
    }
}

// MARK: - PREVIEW

struct RectangularButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangularButton(icon: "person.fill", text: "测试", width: 100, height: 100)
    }
}
