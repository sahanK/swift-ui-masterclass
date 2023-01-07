import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
  let hapticFeedback = UINotificationFeedbackGenerator()
  
  @State private var highScore: Int = UserDefaults.standard.integer(forKey: "HighScore")
  @State private var coins: Int = 100
  @State private var betAmount: Int = 10
  @State private var isActiveBet10: Bool = true
  @State private var isActiveBet20: Bool = false
  @State private var reels: Array = [0, 1, 2]
  @State private var showingInfoView: Bool = false
  @State private var showingModal: Bool = false
  @State private var animatingSymbol: Bool = false
  @State private var animatingModel: Bool = false
  
  // MARK: - FUNCTIONS
  
  // SPIN THE REELS
  func spinReels() {
    reels = reels.map({ _ in
      Int.random(in: 0...symbols.count - 1)
    })
    playSound(sound: "spin", type: "mp3")
    hapticFeedback.notificationOccurred(.success)
  }
  
  // CHECK THE WINNING
  func checkWinning() {
    if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
      // PLAYER WINS
      playerWins()
      
      // NEW HIGHSCORE
      if coins > highScore {
        newHighScore()
      } else {
        playSound(sound: "win", type: "mp3")
      }
    } else {
      // PLAYER LOSES
      playerLoses()
    }
  }
  
  func playerWins() {
    coins += betAmount * 10
  }
  
  func newHighScore() {
    highScore = coins
    UserDefaults.standard.set(highScore, forKey: "HighScore")
    playSound(sound: "high-score", type: "mp3")
  }
  
  func playerLoses() {
    coins -= betAmount
  }
  
  func activateBet20() {
    toggleActiveBet()
    betAmount = 20
    playSound(sound: "casino-chips", type: "mp3")
    hapticFeedback.notificationOccurred(.success)
  }
  
  func activateBet10() {
    toggleActiveBet()
    betAmount = 10
    playSound(sound: "casino-chips", type: "mp3")
    hapticFeedback.notificationOccurred(.success)
  }
  
  func toggleActiveBet() {
    isActiveBet20.toggle()
    isActiveBet10.toggle()
  }

  // GAME IS OVER
  func isGameOver() {
    if coins <= 0 {
      // SHOW MODEL WINDOW
      showingModal = true
      playSound(sound: "game-over", type: "mp3")
    }
  }
  
  // RESET GAME
  func resetGame() {
    UserDefaults.standard.set(0, forKey: "HighScore")
    highScore = 0
    coins = 100
    activateBet10()
    playSound(sound: "chimeup", type: "mp3")
  }
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      // MARK: - BACKGROUND
      LinearGradient(colors: [Color("ColorPink"), Color("ColorPurple")], startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
      
      // MARK: - INTERFACE
      VStack(alignment: .center, spacing: 5) {
        // MARK: - HEADER
        LogoView()
        
        Spacer()
        
        // MARK: - SCORE
        HStack {
          HStack {
            Text("Your\nCoins".uppercased())
              .scoreLabelStyle()
              .multilineTextAlignment(.trailing)
            Text("\(coins)")
              .scoreNumberStyle()
              .modifier(ScoreNumberModifier())
          }
          .modifier(ScoreContainerModifier())
          
          Spacer()
          
          HStack {
            Text("\(highScore)")
              .scoreNumberStyle()
              .modifier(ScoreNumberModifier())
            Text("High\nScore".uppercased())
              .scoreLabelStyle()
              .multilineTextAlignment(.leading)
          }
          .modifier(ScoreContainerModifier())
        }
        
        // MARK: - SLOT MACHINE
        VStack(alignment: .center, spacing: 0) {
          // MARK: - REEL #1
          ZStack {
            ReelView()
            Image(symbols[reels[0]])
              .resizable()
              .modifier(ImageModifier())
              .opacity(animatingSymbol ? 1 : 0)
              .offset(y: animatingSymbol ? 0 : -50)
              .onAppear(perform: {
                withAnimation(.easeOut(duration: Double.random(in: 0.5...0.7))) {
                  animatingSymbol.toggle()
                }
                playSound(sound: "riseup", type: "mp3")
              })
            
          }
          
          HStack(alignment: .center, spacing: 0) {
            // MARK: - REEL #2
            ZStack {
              ReelView()
              Image(symbols[reels[1]])
                .resizable()
                .modifier(ImageModifier())
                .opacity(animatingSymbol ? 1 : 0)
                .offset(y: animatingSymbol ? 0 : -50)
                .onAppear(perform: {
                  withAnimation(.easeOut(duration: Double.random(in: 0.7...0.9))) {
                    animatingSymbol.toggle()
                  }
                })
            }
            
            Spacer()
            
            // MARK: - REEL #3
            ZStack {
              ReelView()
              Image(symbols[reels[2]])
                .resizable()
                .modifier(ImageModifier())
                .opacity(animatingSymbol ? 1 : 0)
                .offset(y: animatingSymbol ? 0 : -50)
                .onChange(of: reels, perform: { _ in
                  withAnimation(.easeOut(duration: Double.random(in: 0.9...1.1))) {
                    animatingSymbol.toggle()
                  }
                })
            }
          }
          .frame(maxWidth: 500)
          
          // MARK: - SPIN BUTTON
          Button(action: {
            animatingSymbol = false
            // SPIN THE REELS
            spinReels()
            
            // CHECK WINNING
            checkWinning()
            
            // GAME IS OVER
            isGameOver()
          }) {
            Image("gfx-spin")
              .renderingMode(.original)
              .resizable()
              .modifier(ImageModifier())
          }
        }//: SLOT MACHINE
        .layoutPriority(2)
        
        // MARK: - FOOTER
        
        Spacer()
        
        HStack {
          // MARK: - BET 20
          HStack(alignment: .center, spacing: 10) {
            Button(action: {
              withAnimation(.easeOut) {
                activateBet20()
              }
            }) {
              Text("20")
                .fontWeight(.heavy)
                .foregroundColor(isActiveBet20 ? .yellow : .white)
                .modifier(BetNumberModifier())
            }
            .modifier(BetCapsuleModifier())
            
            Image("gfx-casino-chips")
              .resizable()
              .offset(x: isActiveBet20 ? 0 : 20)
              .opacity(isActiveBet20 ? 1 : 0)
              .modifier(CasinoChipsModifier())

          }
          
          Spacer()
          
          // MARK: - BET 10
          HStack(alignment: .center, spacing: 10) {
            Image("gfx-casino-chips")
              .resizable()
              .offset(x: isActiveBet10 ? 0 : -20)
              .opacity(isActiveBet10 ? 1 : 0)
              .modifier(CasinoChipsModifier())
            Button(action: {
              withAnimation(.easeOut) {
                activateBet10()
              }
            }) {
              Text("10")
                .fontWeight(.heavy)
                .foregroundColor(isActiveBet10 ? .yellow : .white)
                .modifier(BetNumberModifier())
            }
            .modifier(BetCapsuleModifier())
          }
        }
      }//: VSTACK
      // MARK: - BUTTONS
      .overlay(
        // RESET
        Button(action: {
          resetGame()
        }) {
          Image(systemName: "arrow.2.circlepath.circle")
            .modifier(ButtonModifier())
        },
        alignment: .topLeading
      )
      .overlay(
        // Info
        Button(action: {
          showingInfoView.toggle()
        }) {
          Image(systemName: "info.circle")
            .modifier(ButtonModifier())
        },
        alignment: .topTrailing
      )
      .padding()
      .frame(maxWidth: 720)
      .blur(radius: showingModal ? 5 : 0, opaque: false)
      
      // MARK: - POPUP
      if showingModal {
        ZStack {
          Color("ColorTransparentBlack").edgesIgnoringSafeArea(.all)
          VStack(spacing: 0) {
            // TITLE
            Text("Game Over".uppercased())
              .font(.system(.title, design: .rounded))
              .fontWeight(.heavy)
              .padding()
              .frame(minWidth: 0, maxWidth: .infinity)
              .background(Color("ColorPink"))
              .foregroundColor(.white)
            
            Spacer()
            
            // MESSAGE
            VStack(alignment: .center, spacing: 16) {
              Image("gfx-seven-reel")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 72)
              
              Text("Bad luck! you lost all the coins. \nLet's play again.")
                .font(.system(.body, design: .rounded))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .layoutPriority(1)
              
              Button(action: {
                showingModal = false
                coins = 100
                animatingModel = false
                activateBet10()
              }) {
                Text("New game".uppercased())
                  .font(.system(.body, design: .rounded))
                  .fontWeight(.semibold)
                  .foregroundColor(Color("ColorPink"))
                  .padding(.horizontal, 12)
                  .padding(.vertical, 8)
                  .frame(maxWidth: 128)
                  .background(
                    Capsule()
                      .strokeBorder(lineWidth: 1.75)
                      .foregroundColor(Color("ColorPink"))
                  )
              }
            }
            
            Spacer()
          }
          .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
          .background(.white)
          .cornerRadius(20)
          .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 0)
          .opacity(animatingModel ? 1 : 0)
          .offset(y: animatingModel ? 0 : -100)
          .onAppear(perform: {
            withAnimation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0)) {
              animatingModel.toggle()
            }
          })
        }
      }
    
    }//: ZSTACK
    .sheet(isPresented: $showingInfoView) {
      InfoView()
    }
  }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
