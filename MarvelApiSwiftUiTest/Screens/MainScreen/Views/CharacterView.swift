//
//  CharacterView.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/10/20.
//

import DomainLayer
import struct Kingfisher.KFImage
import SwiftUI

struct CharacterView: View {
    let character: Character

    var imageUrl: URL? {
        if let imagePath = character.thumbnail?.path, let imageExt = character.thumbnail?.ext {
            return URL(string: "\(imagePath)\(imageExt)")
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
    }

    private var poster: some View {
        KFImage(imageUrl)
            .aspectRatio(contentMode: .fit)
            .frame(idealHeight: 100)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: MockJson.charactersSample[0])
    }
}
