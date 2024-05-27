//
//  Avatar.swift
//  Lenzz
//
//  Created by Aiden Yang on 2024/5/27.
//
import SwiftUI

struct DefaultUserAvatar: View {
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.2))

            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
                .padding(width * 0.25) // Padding is 15% of avatar size
        }
        .frame(width: width, height: height)
    }
}

struct Avatar: View {
    // MARK: - PROPERTIES

    let avatarUrlString: String?

    // MARK: - BODY

    var body: some View {
        // Add your UI elements here
        if let avatarUrlString = avatarUrlString, let imageURL = URL(string: avatarUrlString) {
            AsyncImage(url: imageURL) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    DefaultUserAvatar(width: 60, height: 60)
                } else {
                    ProgressView() // Display a loader while the image is loading
                }
            }
        } else {
            DefaultUserAvatar(width: 60, height: 60)
        }
    }
}

// MARK: - PREVIEW

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(avatarUrlString: "")
    }
}
