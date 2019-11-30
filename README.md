# Database Server
Database Server for e-players.

## Tables

### Game
  Game table for maintaining information of games.
  - id
  - name

### User
  User table for maintaining information of users.
  - user_id
  - name
  - email
  - password(hashed)
  - gender
  - bio
  - birthday
  - hosting_experience
  - games
  - participating_teams

### Tornament
  Tournament table.
  Every tournament remains even if the tournament is over.
  - id
  - name
  - duration
  - participation_deadline
  - team_number_limit
  - player_number_limit
  - is_private
  - game
  - user

### News Feed
  This news feed table exists just for managers of the application.
  - id
  - title
  - image_path
  - text

### Participating Team
  For managing teams in a tournament.
  - id
  - user
  - tournament

### Chat Text
  Chat Text table for managing information of chat.
  - id
  - text
  - sender(user)
  - recipient(user)

### Win
  To score results of the tournament per user.
  - id
  - win_count
  - user
  - tournament