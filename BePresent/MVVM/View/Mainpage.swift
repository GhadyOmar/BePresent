//
//  Mainpage.swift
//  BePresent
//
//  Created by Ghady Al Omar on 25/11/1447 AH.
//
import SwiftUI

struct Mainpage: View {
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()

            VStack(spacing: 0) {

                // MARK: - Header
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Good morning,")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(Color("SubtitleColor"))
                        Text("Ghady")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color("TitleColor"))
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color("TitleColor"))
                            .frame(width: 48, height: 48)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .strokeBorder(Color("TitleColor").opacity(0.15), lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal, 28)
                .padding(.top, 20)
                .padding(.bottom, 8)

                Spacer()

                // MARK: - Empty State
                VStack(spacing: 0) {
                    ZStack {
                        Circle()
                            .fill(Color("OuterCircle3").opacity(0.5))
                            .frame(width: 93, height: 93)
                            .scaleEffect(viewModel.pulseAnimation ? 1.06 : 1.0)
                            .animation(
                                .easeInOut(duration: 3).repeatForever(autoreverses: true),
                                value: viewModel.pulseAnimation
                            )
                            .glassEffect()

                        Circle()
                            .fill(Color("MiddleCircle3").opacity(0.7))
                            .frame(width: 70, height: 70)
                            .scaleEffect(viewModel.pulseAnimation ? 1.04 : 1.0)
                            .animation(
                                .easeInOut(duration: 3).delay(0.3).repeatForever(autoreverses: true),
                                value: viewModel.pulseAnimation
                            )
                            .glassEffect()
                            .overlay(
                                Image(systemName: "location")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("TitleColor").opacity(0.9))
                                    .bold(true)
                            )
                    }
                    .onAppear { viewModel.startPulse() }

                    Spacer().frame(height: 36)

                    Text("Set your place")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color("TitleColor"))

                    Spacer().frame(height: 10)

                    Text("Choose a location to begin\nyour sensory journey.")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(Color("SubtitleColor"))
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)

                    Spacer().frame(height: 32)

                    Button(action: {}) {
                        HStack(spacing: 8) {
                            Image(systemName: "location")
                                .font(.system(size: 14, weight: .medium))
                            Text("Pick a location")
                                .font(.system(size: 15, weight: .semibold))
                        }
                        .foregroundColor(Color("TitleColor"))
                        .padding(.horizontal, 28)
                        .padding(.vertical, 14)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .strokeBorder(Color("TitleColor").opacity(0.15), lineWidth: 1)
                        )
                    }
                }

                Spacer()

                // MARK: - Tab Bar
                HStack(spacing: 10) {
                    HStack(spacing: 0) {
                        TabBarButton(
                            icon: Tab.main.icon,
                            label: Tab.main.label,
                            isSelected: viewModel.selectedTab == .main
                        ) { viewModel.selectTab(.main) }

                        TabBarButton(
                            icon: Tab.memory.icon,
                            label: Tab.memory.label,
                            isSelected: viewModel.selectedTab == .memory
                        ) { viewModel.selectTab(.memory) }
                    }
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .strokeBorder(Color("TitleColor").opacity(0.08), lineWidth: 1)
                    )

                    Button(action: { viewModel.selectTab(.profile) }) {
                        Image(systemName: Tab.profile.icon)
                            .font(.system(size: 25))
                            .foregroundColor(
                                viewModel.selectedTab == .profile
                                    ? Color("TitleColor")
                                    : Color("SubtitleColor")
                            )
                            .frame(width: 58, height: 58)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .strokeBorder(Color("TitleColor").opacity(0.08), lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    Mainpage()
}
