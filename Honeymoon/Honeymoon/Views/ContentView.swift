//
//  ContentView.swift
//  Honeymoon
//
//  Created by Sahan Walpita on 2022-12-27.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  @State private var showAlert: Bool = false
  @State private var showGuide: Bool = false
  @State private var showInfo: Bool = false
  @GestureState private var dragState = DragState.inactive
  private var dragAreaThreshold: CGFloat = 65.0
  @State private var lastCardIndex: Int = 1
  @State private var cardRemovalTransition: AnyTransition = AnyTransition.trailingBottom
  
  // MARK: - CARD VIEWS
  @State private var cardViews: [CardView] = {
    var views = [CardView]()
    for index in 0..<2 {
      views.append(CardView(honeymoon: honeymoonData[index]))
    }
    return views
  }()
  
  // MARK: - FUNCTIONS
  func isTopCard(cardView: CardView) -> Bool {
    guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
      return false
    }
    return index == 0
  }
  
  private func moveCards() {
    cardViews.removeFirst()
    lastCardIndex += 1
    let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
    let newCardView = CardView(honeymoon: honeymoon)
    cardViews.append(newCardView)
  }
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
        .opacity(dragState.isDragging ? 0 : 1)
        .animation(.default)
      
      Spacer()
      
      // MARK: - CARDS
      ZStack {
        ForEach(cardViews) { cardView in
          cardView
            .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
            .overlay(
              ZStack {
                Image(systemName: "x.circle")
                  .modifier(SymbolModifier())
                  .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0)
                Image(systemName: "heart.circle")
                  .modifier(SymbolModifier())
                  .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0)
              }
            )
            .offset(x: isTopCard(cardView: cardView) ? dragState.translation.width : 0, y: isTopCard(cardView: cardView) ? dragState.translation.height : 0)
            .scaleEffect(dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1)
            .rotationEffect(isTopCard(cardView: cardView) ? Angle(degrees: dragState.translation.width/12) : Angle(degrees: 0))
            .animation(.interpolatingSpring(stiffness: 120, damping: 120))
            .gesture(
              LongPressGesture(minimumDuration: 0.01)
                .sequenced(before: DragGesture())
                .updating($dragState, body: {(value, state, transaction) in
                  switch value {
                    case .first(true):
                      state = .pressing
                    case .second(true, let drag):
                      state = .dragging(translation: drag?.translation ?? .zero)
                    default:
                      break
                  }
                })
                .onChanged({ (value) in
                  guard case .second(true, let drag?) = value else {
                    return
                  }
                  
                  if drag.translation.width < dragAreaThreshold {
                    cardRemovalTransition = .leadingBottom
                  }
                  
                  if drag.translation.width > dragAreaThreshold {
                    cardRemovalTransition = .trailingBottom
                  }
                })
                .onEnded({ (value) in
                  guard case .second(true, let drag?) = value else {
                    return
                  }
                  
                  if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                    playSound(sound: "sound-rise", type: "mp3")
                    moveCards()
                  }
                })
            )
            .transition(cardRemovalTransition)
        }
      }
      .padding(.horizontal)
      
      Spacer()
      
      // MARK: - FOOTER
      FooterView(showBookingAlert: $showAlert)
        .opacity(dragState.isDragging ? 0 : 1)
        .animation(.default)
    }//: VSTACK
    .alert("SUCCESS", isPresented: $showAlert, actions: {
      Button(role: .cancel, action: {}, label: {
        Text("Happy Honeymoon!")
      })
    }, message: {
      Text("Wishing a lovely and most precious of times together for the amazing couple.")
    })
  }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
