//
//  MomentsView.swift
//  Taya-Demo-App
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct Moment {
    let title: String
    let content: String
}

struct MomentsView: View {
    
    let moments = [
        Moment(title: "Founders Discussing Chat Experience", content: "Two founders discuss designing an elegant chat experience that helps users reconnect."),
        Moment(title: "Founders Discussing Chat Experience", content: "Two founders discuss designing an elegant chat experience that helps users reconnect."),
        Moment(title: "Founders Discussing Chat Experience", content: "Two founders discuss designing an elegant chat experience that helps users reconnect.")
    ]
    
    var body: some View {
        NavigationStack {
            BaseVerticalScollView {
                BaseVStack(spacing: 25) {
                    Text("Live transcription: Auto-stops after silence")
                        .font(.paragraph2, .shade700)
                    Button {
                        
                    } label: {
                        BaseSystemImage("pause.fill", size: 20, color: .white)
                            .frame(width: 60, height: 60)
                    }
                    .buttonStyle(.glassProminent)
                    .buttonBorderShape(.circle)
                    .tint(.brand200)
                    
                }
                .frame(height: 200)
                
                HLeading {
                    Spacing(13)
                    Text("Your Moments")
                        .font(.paragraph1, .medium, .shade600)
                }
                Spacing(8)
                
                VStack(spacing: 10) {
                    ForEach(moments, id: \.title) { moment in
                        MomentView(moment: moment)
                    }
                }
                
            }
            .background(alignment: .top) {
                LinearGradient(
                    gradient: Gradient(colors: [.brand100, .cream100, .cream100]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                .ignoresSafeArea(.all)
            }
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                    } label: {
                        HStack {
                            Text("(0)")
                                .font(.paragraph3, .shade600)
                            Text("Connected")
                                .font(.paragraph3, .shade700)
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        BaseSystemImage("magnifyingglass", size: 12, weight: .semibold, color: .brand400)
                    }
                }
                ToolbarSpacer(placement: .topBarTrailing)
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        BaseSystemImage("person.crop.circle.fill", size: 20, weight: .semibold, color: .brand400)
                    }
                }
            }
        }
        
    }
    
}

struct MomentView: View {
    
    let moment: Moment
    
    var body: some View {
        BaseVStack(spacing: 8, padding: 15) {
            HJustified(spacing: 10, vAlignment: .top) {
                Text(moment.title)
                    .font(.paragraph1, .medium)
                    .lineSpacing(1.5)
            } content2: {
                Text("9:41 AM")
                    .font(.paragraph3, .shade500)
                    .padding(.top, 4)
            }
            HLeading {
                Text(moment.content)
                    .font(.paragraph2, .shade700)
                    .lineSpacing(1)
            }
        }
        .background(.white)
        .cornerRadius(15)
        .glassEffect(.clear.tint(.white.opacity(0.25)).interactive(true), in: RoundedRectangle(cornerRadius: 15))
    }
    
}

#Preview {
    MomentsView()
}
