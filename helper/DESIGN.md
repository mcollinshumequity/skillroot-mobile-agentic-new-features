# SkillROOT Design System

This document outlines the core design tokens, typography, and components for the SkillROOT mobile application. It serves as the source of truth for UI/UX consistency and can be used with Google Stitch or other design tools.

## 1. Brand & Identity
- **App Name**: SkillROOT
- **Overall Feel**: Professional, engaging, and structured. Designed for workforce intelligence, skills tracking, and professional profiling.
- **Theme Modes**: Supports both Light and Dark themes dynamically.

## 2. Color Palette

### Primary Colors
These are the core brand colors extracted from the SkillROOT logo.
- **Primary (Deep Blue)**: `#0B72C7`
  - *Usage*: Core actions, primary buttons, active states, key highlights, and app bars.
- **Secondary (Vibrant Orange)**: `#F68B1E`
  - *Usage*: Call-to-action accents, warnings, highlights, indicators, and secondary interactive elements.

### Background & Surface Colors
- **Light Mode Surface**: `#F6F8FB`
  - *Usage*: Main scaffold background for the light theme. Soft off-white to reduce eye strain compared to pure white.
- **Light Mode Cards/Dialogs**: `#FFFFFF`
  - *Usage*: Elevated surfaces, cards, and dropdown menus.
- **Dark Mode Surface**: `#242526`
  - *Usage*: Main scaffold background for the dark theme.
- **Dark Mode Cards/Dialogs**: `#23262F`
  - *Usage*: Elevated surfaces in dark mode.

### Text & Icon Colors
- **Light Mode Text**: Primary `#000000` (87% opacity), Secondary `#A1A1A1`
- **Dark Mode Text**: Primary `#FFFFFF`, Secondary `#A1A1A1`
- **Disabled Elements**: `#A1A1A1` (Both modes)
- **Icons**: `#1F2A3D` (Light Mode), `#FFFFFF` (Dark Mode)

## 3. Typography

The application strictly uses the **Urbanist** font family (via Google Fonts) for all text elements to ensure a modern, clean, and legible appearance.

### Font Weights
- **Regular (400)**: Standard body text.
- **Medium (500)**: Titles, labels, and emphasized body text.
- **Semi-Bold (600)**: Small displays and prominent headers.
- **Bold (700)**: Major headlines and critical emphasis.

### Text Styles
- **Display Large**: 15px, Medium (w500)
- **Display Medium**: 60px, Regular
- **Display Small**: 40px, Semi-Bold (w600)
- **Headline Medium**: 24px, Regular
- **Headline Small**: 20.5px, Bold (w700)
- **Title Large**: 20px, Medium (w500)
- **Title Medium**: 15px, Regular
- **Title Small**: 15px, Medium (w500)
- **Body Large**: 14px, Regular
- **Body Medium**: 16px, Regular
- **Body Small**: 12px, Regular
- **Label Large**: 14px, Medium (w500)
- **Label Small**: 10px, Regular

## 4. Components & Interactive Elements

### Buttons
- **Primary Buttons**: Filled with the Primary Color (`#0B72C7`), white text.
- **Secondary Buttons**: Outlined or filled with Secondary Color (`#F68B1E`).
- **Interaction**: Buttons use `InkRipple` effects for touch feedback.

### Inputs & Forms
- **Fields**: Outlined or filled text fields with clear labeling.
- **Dropdowns**: Cascading selections (e.g., Industry -> Occupation) should be clearly separated and visually distinct.
- **Validation**: Error states use standard red (`#FF0000` or equivalent Material Error Color).

### Navigation
- **App Bar**: 
  - Light Mode: White background with dark icons (`#1F2A3D`). Flat (0 elevation).
  - Dark Mode: Black background with white icons.
- **System Navigation Bar**: Black background with grey dividers.

## 5. Layout & Spacing
- **Scaffold**: Uses a unified background color (Surface color) with elevated white/dark cards to group information (e.g., Job History entries, Task selections).
- **Padding/Margin**: Standardize on multiples of 4 or 8 (e.g., 8px, 16px, 24px) to maintain a consistent grid rhythm throughout the UI.

## 6. Accessibility
- Ensure high contrast between text and background.
- Support scaling fonts via OS-level accessibility settings.
- Interactive elements must be large enough for easy tapping (minimum 48x48 logical pixels recommended).
