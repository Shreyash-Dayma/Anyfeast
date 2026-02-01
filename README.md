# Anyfeast — Personalization UI (Flutter)

This repository contains the Flutter (Material 3) UI implementation for the Anyfeast onboarding personalization flow.

## Structure
- `lib/`
  - `screens/` — individual screen widgets (welcome, goal, diet, activity, cooking, budget, review, success)
  - `widgets/` — reusable components (option card, pill, buttons, header, animated navigation)
  - `theme/` — `app_theme.dart` with colors and text styles
  - `main.dart` — app entry and routes
- `assets/screenshots/` — included UI screenshots

## Screenshots
Below are the onboarding screens included in this repository (click images to open full-size).

<p align="center">
  <img src="assets/screenshots/welcome.png" alt="Welcome" width="420" />
  <img src="assets/screenshots/goal.png" alt="Goal" width="420" />
</p>

<p align="center">
  <img src="assets/screenshots/diet.png" alt="Diet" width="320" />
  <img src="assets/screenshots/activity.png" alt="Activity" width="320" />
  <img src="assets/screenshots/cooking.png" alt="Cooking" width="320" />
</p>

<p align="center">
  <img src="assets/screenshots/budget.png" alt="Budget" width="420" />
  <img src="assets/screenshots/review.png" alt="Review" width="420" />
</p>

<p align="center">
  <img src="assets/screenshots/Success.png" alt="Success" width="420" />
</p>

*Images are stored in `assets/screenshots/` and will display automatically on GitHub.*

## Running locally
1. Install Flutter (3.7+ recommended) and enable web support.
2. Run the app on web server:

   ```bash
   flutter run -d web-server --web-port=8080
   ```

3. Open: http://localhost:8080

