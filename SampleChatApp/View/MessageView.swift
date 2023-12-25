//
//  MessageView.swift
//  SampleChatApp
//
//  Created by 浦山秀斗 on 2023/12/17.
//

import SwiftUI

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color(uiColor: UIColor.systemGray5))
                .clipShape(Circle())

            
            VStack(alignment: .leading, spacing: 4) {
                Text(message.user.name)
                    .font(.headline)
                
                Text(message.text)
                
                Text(message.date.description)
                    .font(.footnote)
            }
        }

    }
}

#Preview {
    MessageView(message: Sample.message)
}
