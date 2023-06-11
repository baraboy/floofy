//
//  OnboardingView.swift
//  floofy
//
//  Created by Rizky Dwi Hadisaputro on 04/06/23.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let description : String
}

private let onBoardingSteps = [
    OnBoardingStep(image: "onboarding1", description: "Scan your cat or dog’s skin to know the classification of ringworm and scabies diseases"),
    OnBoardingStep(image: "onboarding2", description: "Get notifications about your cat's or dog's schedule that you have set in advance."),
    OnBoardingStep(image: "onboarding3", description: "With the missions, keeping your pets healthy will never be this fun!")]


struct OnboardingView: View {
    
    @State private var currentStep = 0
    
    var body: some View {
        NavigationView{
            VStack {
                if currentStep != onBoardingSteps.count - 1 {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.currentStep = onBoardingSteps.count - 1
                        }) {
                            Text("Skip")
                                .padding(.horizontal, 28)
                                .foregroundColor(.gray)
                        }
                    }
                }
                else{
                    HStack {
                        Spacer()
                        Button(action: {
                        }) {
                            Text("Skip")
                                .padding(.horizontal, 28)
                                .foregroundColor(.white)
                        }
                    }
                }
                Text("Floofy.")
                    .font(.system(size: 60))
                    .bold()
                    .foregroundColor(Color("PrimaryColor"))
                    .offset(y: 50)
                
                TabView(selection: $currentStep) {
                    ForEach(0..<onBoardingSteps.count, id: \.self) { step in
                        VStack {
                            Image(onBoardingSteps[step].image)
                                .resizable()
                                .frame(width: 300, height: 300)
                            
                            Text(onBoardingSteps[step].description)
                                .bold()
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                                .padding(.top, 16)
                                .foregroundColor(Color("PrimaryColor"))
                        }
                        .tag(step)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(0..<onBoardingSteps.count, id: \.self) { step in
                        if step == currentStep {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(Color("PrimaryColor"))
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.bottom, 24)
                
                if currentStep < onBoardingSteps.count - 1 {
                    Button(action: {
                        self.currentStep += 1
                    }) {
                        Text("Next")
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(Color("PrimaryColor"))
                            .cornerRadius(16)
                            .padding(.horizontal, 16)
                            .foregroundColor(.white)
                    }
                    .buttonStyle(.plain)
                } else {
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            Text("Get Started")
                                .padding(16)
                                .frame(maxWidth: .infinity)
                                .background(Color("PrimaryColor"))
                                .cornerRadius(16)
                                .padding(.horizontal, 16)
                                .foregroundColor(.white)
                        })
                }
            }
            .background(Color.white)
        }
        
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
