# AuthCheck3

This project extends the default Phoenix authentication system by seamlessly integrating Google OAuth authentication, along with traditional login, including working email notifications.
With all the code parts, I have added comments alongside so that user can understand what is
going on

## Setup

To start your Phoenix server:

1. Run `mix setup` to install and set up dependencies.
2. Configure your environment variables for Google OAuth:
   - `GOOGLE_CLIENT_ID`
   - `GOOGLE_CLIENT_SECRET`
   
   These variables should be stored securely in your system environment for security reasons. If you want to run the project, create these environment variables on your local machine.
3. Start the Phoenix endpoint with:
   - `mix phx.server`
   - Or inside IEx with `iex -S mix phx.server`

Once the server is up, you can visit [`localhost:4000`](http://localhost:4000) in your browser.

### Authentication Features
- **Traditional Login:** Full authorization system with email verification, all working as expected.
- **Google Login:** OAuth2 authentication has been integrated seamlessly on top of the existing authorization system.
- **Email Functionality:** Test both traditional login and Google login mail flows by visiting the `/dev/mailbox` route.

### Database Structure
A new field is added to the user database table to indicate whether a user has signed up via Google OAuth. Users logging in with Google OAuth will not have a password saved, as authentication is handled via OAuth. The system stores both Google OAuth users and traditional email-password users in the same table, with this additional field distinguishing between them.

