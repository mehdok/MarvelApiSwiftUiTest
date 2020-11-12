//
//  CharacterView.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/10/20.
//

import DomainLayer
import struct Kingfisher.KFImage
import SwiftUI
import DesignSystem

struct CharacterView: View {
    let kCellHeight: CGFloat = 240.0
    let character: Character

    var imageUrl: URL? {
        if let imagePath = character.thumbnail?.path, let imageExt = character.thumbnail?.ext {
            return URL(string: "\(imagePath).\(imageExt)")
        }
        return nil
    }

    var title: String {
        character.name ?? "N/A"
    }

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom), content: {
            poster
            Text(title)
        })
        .frame(height: kCellHeight, alignment: .center)
    }

    private var poster: some View {
        GeometryReader { geo in
            KFImage(imageUrl)
                .cancelOnDisappear(true)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: kCellHeight, alignment: .center)
                .clipShape(Rectangle())
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: MockJson.charactersSample[0])
    }
}
