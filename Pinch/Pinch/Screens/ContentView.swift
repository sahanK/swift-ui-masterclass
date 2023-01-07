//
//  ContentView.swift
//  Pinch
//
//  Created by Sahan Kaushalya on 2022-08-30.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  
  @State private var isAnimating: Bool = false
  @State private var imageScale: CGFloat = 1
  @State private var imageOffset: CGSize = .zero
  @State private var isDrawerOpen: Bool = false
  @State private var pageIndex: Int = 1
  
  let pages: [Page] = pagesData
  
  // MARK: - Function
  
  func resetImageState() {
    return withAnimation(.spring()) {
      imageScale = 1
      imageOffset = .zero
    }
  }
  
  func currentPage() -> String {
    return pages[pageIndex - 1].imageName
  }
  
  // MARK: - Content
  
    var body: some View {
      NavigationView {
        ZStack {
          Color.clear
          // MARK: - PAGE IMAGE
          
          Image(currentPage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .padding()
            .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
            .opacity(isAnimating ? 1 : 0)
            .offset(x: imageOffset.width, y: imageOffset.height)
            .scaleEffect(imageScale)
            // MARK: - DOUBLE TAP
            .onTapGesture(count: 2, perform: {
              if imageScale == 1 {
                withAnimation(.spring()) {
                  imageScale = 5
                }
              } else {
                withAnimation(.spring()) {
                  resetImageState()
                }
              }

            })
            // MARK: - DRAG
            .gesture(
              DragGesture()
                .onChanged { gesture in
                  withAnimation(.linear(duration: 1)) {
                    imageOffset = gesture.translation
                  }
                }
                .onEnded { _ in
                  if imageScale <= 1 {
                    resetImageState()
                  }
                }
            )
            // MARK: - MAGNIFICATION
            .gesture(
              MagnificationGesture()
                .onChanged { gesture in
                  withAnimation(.linear(duration: 1)) {
                    if imageScale >= 1 && imageScale <= 5 {
                      imageScale = gesture
                    } else if imageScale > 5 {
                      imageScale = 5
                    }
                  }
                }
                .onEnded { _ in
                  if imageScale > 5 {
                    imageScale = 5
                  } else if imageScale <= 1 {
                    imageScale = 1
                  }
                }
            )
          
        }//: ZSTACK
        .navigationTitle("Pinch & Zoom")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
          isAnimating = true
        })
        // MARK: - INFO PANEL
        .overlay(
          InfoPanelView(scale: imageScale, offset: imageOffset)
            .padding(.horizontal)
            .padding(.top, 30),
          alignment: .top
        )
        // MARK: - CONTROLS PANEL
        .overlay(
          Group {
            HStack {
              // SCALE DOWN
              Button {
                withAnimation(.spring()) {
                  if imageScale > 1 {
                    imageScale -= 1
                    
                    if imageScale <= 1 {
                      resetImageState()
                    }
                  }
                }
              } label: {
                ControlImageView(icon: "minus.magnifyingglass")
              }
              
              // RESET
              Button {
                resetImageState()
              } label: {
                ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
              }
              
              // SCALE UP
              Button {
                withAnimation(.spring()) {
                  if imageScale < 5 {
                    imageScale += 1
                    
                    if imageScale > 5 {
                      imageScale = 5
                    }
                  }
                }
              } label: {
                ControlImageView(icon: "plus.magnifyingglass")
              }
              
            }//: CONTROLS
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .opacity(isAnimating ? 1 : 0)
          },
          alignment: .bottom
        )
        .overlay(
          HStack {
            // MARK: - DRAWER HANDLE
            
            Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
              .resizable()
              .scaledToFit()
              .frame(height: 40)
              .padding(8)
              .foregroundStyle(.secondary)
              .onTapGesture(perform: {
                withAnimation(.easeOut) {
                  isDrawerOpen.toggle()
                }
              })
            
            // MARK: - THUMBNAILS
            
            ForEach(pages) { page in
              Image(page.thumbnailName)
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .cornerRadius(8)
                .shadow(radius: 4)
                .opacity(isDrawerOpen ? 1 : 0)
                .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                .onTapGesture(perform: {
                  isAnimating = true
                  pageIndex = page.id
                })
            }
            
            Spacer()
          }//: DRAWER
          .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
          .background(.ultraThinMaterial)
          .cornerRadius(12)
          .opacity(isAnimating ? 1 : 0)
          .frame(width: 260)
          .padding(.top, UIScreen.main.bounds.height / 12)
          .offset(x: isDrawerOpen ? 20 : 215)
          
          ,alignment: .topTrailing
          
        )
      }//: NAVIGATION
      .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
        .preferredColorScheme(.dark)
    }
}
