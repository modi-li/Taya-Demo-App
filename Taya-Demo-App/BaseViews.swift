//
//  BaseViews.swift
//  Taya-Demo-App
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct Spacing: View {
    
    enum DirectionFocus {
        case vertical
        case horizontal
    }
    
    let size: CGFloat
    let directionFocus: DirectionFocus?
    
    init(_ size: CGFloat, directionFocus: DirectionFocus? = nil) {
        self.size = size
        self.directionFocus = directionFocus
    }
    
    var body: some View {
        Color.clear
            .frame(width: directionFocus == .vertical ? 0 : size, height: directionFocus == .horizontal ? 0 : size)
    }
}

struct BaseHStack<Content: View>: View {
    
    let spacing: CGFloat
    let vAlignment: VAlignment
    let hAlignment: HAlignment
    
    let content: () -> Content
    
    
    init(spacing: CGFloat = 0, vAlignment: VAlignment = .center, hAlignment: HAlignment = .center, @ViewBuilder content: @escaping () -> Content) {
        self.spacing = spacing
        self.vAlignment = vAlignment
        self.hAlignment = hAlignment
        self.content = content
    }
    
    var body: some View {
        HStack(alignment: vAlignment.native, spacing: spacing) {
            if hAlignment == .trailing {
                Spacer()
            }
            content()
            if hAlignment == .leading {
                Spacer()
            }
        }
    }
    
}

enum VAlignment {
    case top
    case center
    case bottom
    
    var native: VerticalAlignment {
        switch self {
        case .top: return .top
        case .center: return .center
        case .bottom: return .bottom
        }
    }
    
}

enum HAlignment {
    case leading
    case center
    case trailing
    
    var native: HorizontalAlignment {
        switch self {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }
}

struct BaseVStack<Content: View>: View {
    
    let spacing: CGFloat
    let verticalAlignment: VAlignment
    let horizontalAlignment: HAlignment
    let padding: CGFloat?
    let withScreenHPadding: Bool
    
    let content: () -> Content
    
    
    init(spacing: CGFloat = 0, vAlignment: VAlignment = .center, hAlignment: HAlignment = .center, padding: CGFloat? = nil, withScreenHPadding: Bool = false, @ViewBuilder content: @escaping () -> Content) {
        self.spacing = spacing
        self.verticalAlignment = vAlignment
        self.horizontalAlignment = hAlignment
        self.padding = padding
        self.withScreenHPadding = withScreenHPadding
        self.content = content
    }
    
    var body: some View {
        
        VStack(alignment: horizontalAlignment.native, spacing: spacing) {
            if verticalAlignment == .bottom {
                Spacer()
            }
            content()
            if verticalAlignment == .top {
                Spacer()
            }
        }
        .applyIf(padding != nil) {
            $0.padding(padding!)
        }
        .applyIf(withScreenHPadding) {
            $0.padding(.horizontal, Sizes.screenHPadding)
        }
    }
    
}

struct HLeading<Content: View>: View {
    
    let spacing: CGFloat
    let content: () -> Content
    
    init(spacing: CGFloat = 0, @ViewBuilder content: @escaping () -> Content) {
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        BaseHStack(spacing: spacing) {
            content()
            Spacer()
        }
    }
    
}

struct HTrailing<Content: View>: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        BaseHStack {
            Spacer()
            content()
        }
    }
    
}

struct HJustified<Content1: View, Content2: View>: View {
    
    let spacing: CGFloat
    let vAlignment: VAlignment
    
    let content1: () -> Content1
    let content2: () -> Content2
    
    init(spacing: CGFloat = 0, vAlignment: VAlignment = .center, @ViewBuilder content1: @escaping () -> Content1, @ViewBuilder content2: @escaping () -> Content2) {
        self.spacing = spacing
        self.vAlignment = vAlignment
        self.content1 = content1
        self.content2 = content2
    }
    
    var body: some View {
        BaseHStack(vAlignment: vAlignment) {
            BaseHStack {
                content1()
            }
            Spacer()
            Spacing(spacing)
            BaseHStack {
                content2()
            }
        }
    }
    
}

struct HCenter<Content: View>: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        BaseHStack {
            Spacer()
            content()
            Spacer()
        }
    }
    
}


struct VJustified<Content1: View, Content2: View>: View {
    
    let hAlignment: HAlignment
    
    let content1: () -> Content1
    let content2: () -> Content2
    
    init(hAlignment: HAlignment = .center, @ViewBuilder content1: @escaping () -> Content1, @ViewBuilder content2: @escaping () -> Content2) {
        self.hAlignment = hAlignment
        self.content1 = content1
        self.content2 = content2
    }
    
    var body: some View {
        BaseVStack(hAlignment: hAlignment) {
            BaseVStack {
                content1()
            }
            Spacer()
            BaseVStack {
                content2()
            }
        }
    }
    
}


struct BaseVerticalScollView<Content: View>: View {
    
    let spacing: CGFloat
    let withScreenHPadding: Bool
    let content: () -> Content
    
    init(spacing: CGFloat = 0, withScreenHPadding: Bool = true, @ViewBuilder content: @escaping () -> Content) {
        self.spacing = spacing
        self.withScreenHPadding = withScreenHPadding
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            BaseVStack(spacing: spacing, vAlignment: .top, withScreenHPadding: withScreenHPadding) {
                content()
            }
            .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct BaseSystemImage: View {
    
    let name: String
    let size: CGFloat
    let weight: Font.Weight
    let color: Color?
    
    init(_ name: String, size: CGFloat, weight: Font.Weight = .regular, color: Color? = nil) {
        self.name = name
        self.size = size
        self.weight = weight
        self.color = color
    }
    
    var body: some View {
        Image(systemName: name)
            .font(.system(size: size, weight: weight))
            .applyIf(color != nil) {
                $0.foregroundStyle(color!)
            }
    }
    
}

struct BaseImage: View {
    
    let name: String
    let size: CGFloat?
    let width: CGFloat?
    let height: CGFloat?
    let isCircleShape: Bool
    let cornerRadius: CGFloat?
    let contentMode: ContentMode
    
    init(name: String, size: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil, isCircleShape: Bool = false, cornerRadius: CGFloat? = nil, contentMode: ContentMode = .fill) {
        self.name = name
        self.size = size
        self.width = width
        self.height = height
        self.isCircleShape = isCircleShape
        self.cornerRadius = cornerRadius
        self.contentMode = contentMode
    }
    
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .applyIf(size != nil) {
                $0.frame(width: size, height: size)
            }
            .applyIf(width != nil) {
                $0.frame(width: width)
            }
            .applyIf(height != nil) {
                $0.frame(height: height)
            }
            .clipped()
            .applyIf(isCircleShape) {
                $0.clipShape(.circle)
            }
            .applyIf(cornerRadius != nil) {
                $0.clipShape(RoundedRectangle(cornerRadius: cornerRadius!))
            }
    }
}


struct BaseIcon: View {
    
    let name: String
    let size: CGFloat?
    let color: Color?
    
    init(name: String, size: CGFloat? = nil, color: Color? = nil) {
        self.name = name
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Image(name)
            .resizable()
            .applyIf(color != nil) {
                $0.renderingMode(.template)
                    .foregroundStyle(color!)
            }
            .aspectRatio(contentMode: .fit)
            .applyIf(size != nil) {
                $0.frame(width: size, height: size)
            }
            .clipped()
            
    }
}

