# Anyfeast — Personalization UI (Flutter)

This repository contains the Flutter (Material 3) UI implementation for the Anyfeast onboarding personalization flow.

## Structure
- `lib/`
  - `screens/` — individual screen widgets (welcome, goal, diet, activity, cooking, budget, review, success)
  - `widgets/` — reusable components (option card, pill, buttons, header, animated navigation)
  - `theme/` — `app_theme.dart` with colors and text styles
  - `main.dart` — app entry and routes
- `assets/screenshots/` — place screenshots here (see below)

## Screenshots
Place the UI screenshots you provided into `assets/screenshots/` and name them clearly (e.g. `welcome.png`, `goal.png`, `diet.png`, ...).
They will be displayed in the README when you add them to the folder.

## Running locally
1. Install Flutter (3.7+ recommended) and enable web support.
2. Run the app on web server:

   ```bash
   flutter run -d web-server --web-port=8080
   ```

3. Open: http://localhost:8080

## GitHub upload options
- Option A (I push for you): provide a GitHub repo URL or a personal access token (repo scope) and I'll push the code and add screenshots.

- Option B (You push locally): run these commands in this project root:

  ```bash
  git init
  git add .
  git commit -m "chore: add Anyfeast UI"
  git remote add origin <your-github-repo-url>
  git branch -M main
  git push -u origin main
  ```

If you want me to push directly, reply with the repository URL (or a GitHub token) and whether it should be public or private. I can also create the repo for you if you prefer.

---

If you'd like, I can also:
- Add the provided screenshots automatically into `assets/screenshots` and embed them into this README. 📸
- Create a `gh`/GitHub API-based workflow to create the repo and push (requires token). 🔐
