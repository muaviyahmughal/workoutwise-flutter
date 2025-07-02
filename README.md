# WorkoutWise Flutter App

WorkoutWise is a mobile app for real-time fitness feedback, rep counting, and progress tracking. It uses a Python FastAPI backend for video analysis and Supabase for authentication and user data storage.

## Features
- Email/password sign-up and login (Supabase Auth)
- Real-time video upload for plank and squat
- Instant feedback on form and rep count
- Workout history and progress visualization
- User profile management
- Backend API health check

## Project Structure
- `lib/` — Flutter app source code
- `assets/` — Images, fonts, videos, and sounds
- `android/` — Android project files
- `.env` — Environment variables (Supabase credentials, not committed)

## Getting Started
1. **Clone the repo**
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Set up environment variables:**
   - Create a `.env` file in the project root:
     ```
     SUPABASE_URL=your-supabase-url
     SUPABASE_ANON_KEY=your-supabase-anon-key
     ```
4. **Run the app:**
   ```sh
   flutter run
   ```

## Supabase Setup
- Ensure your Supabase project has the correct Auth and table schemas (see `PRD_FLUTTER_APP.md` for SQL).
- Disable email confirmations in Supabase Auth settings for instant signup.
- RLS policies must be enabled for user-specific data.

## API Integration
- The app communicates with a FastAPI backend for video analysis.
- See `API_INTEGRATION_GUIDE.md` for endpoint details and integration examples.

## Development Notes
- All secrets and API keys are managed via `.env` (never commit this file).
- UI is modular and uses a design system for consistency.
- Video animations and onboarding are included in `assets/videos/`.

## Contributing
Pull requests are welcome! Please read the PRD and API guide before contributing.

## License
[MIT](LICENSE)
