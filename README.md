# The Gossip Project

A Ruby on Rails social media platform where users can share, discuss, and interact with gossips (posts). Connect with other users, join conversations, and organize content through tags.

## Features

- **User Accounts**: Create and manage user profiles with city information
- **Gossips**: Share posts/gossips with the community
- **Comments**: Engage in discussions by commenting on gossips
- **Likes**: Express appreciation by liking gossips and comments
- **Tags**: Organize and categorize gossips with customizable tags
- **Private Messaging**: Send private messages to other users
- **User Connections**: Follow and interact with other users in your city and beyond

## Technology Stack

- **Ruby**: 3.x
- **Rails**: 7.x
- **Database**: SQLite3 (development), PostgreSQL (production-ready)
- **Frontend**: ERB templates, CSS, JavaScript

## Setup Instructions

### Prerequisites

- Ruby 3.0 or higher
- Rails 7.0 or higher
- SQLite3 or PostgreSQL
- Bundler

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd The_Gossip_Project
```

2. Install dependencies:
```bash
bundle install
```

3. Setup the database:
```bash
rails db:create
rails db:migrate
rails db:seed
```

4. Start the development server:
```bash
rails server
```

The application will be available at `http://localhost:3000`

## Project Structure

```
app/
├── models/           # User, Gossip, Comment, Like, Tag, etc.
├── controllers/      # Application logic for handling requests
├── views/           # ERB templates for UI
├── helpers/         # Helper methods for views
├── assets/          # Stylesheets and images
└── javascript/      # JavaScript components

config/
├── routes.rb        # Application routes
├── database.yml     # Database configuration
└── environments/    # Environment-specific settings

db/
├── migrate/         # Database migrations
└── seeds.rb         # Seed data for development
```

## Models

- **User**: Represents a platform user with associated city
- **Gossip**: Main content posted by users
- **Comment**: Comments on gossips
- **Like**: Likes for gossips and comments
- **Tag**: Tags to categorize gossips
- **GossipTag**: Join table for gossips and tags
- **PrivateMessage**: Direct messages between users
- **MessageRecipient**: Tracks message recipients
- **City**: Location information for users

## Database Commands

Create database:
```bash
rails db:create
```

Run migrations:
```bash
rails db:migrate
```

Seed sample data:
```bash
rails db:seed
```

Reset database:
```bash
rails db:reset
```

## Testing

To run the test suite:
```bash
rails test
```

## Development

To open the Rails console:
```bash
rails console
```

To generate a new migration:
```bash
rails generate migration MigrationName
```

## Deployment

The application is configured for Docker deployment. Use the provided `Dockerfile` for containerization.

## Contributing

1. Create a new branch for your feature
2. Make your changes
3. Write or update tests
4. Submit a pull request

## License

This project is part of The Hacking Project curriculum.

## Support

For issues or questions, please refer to the project documentation or contact the development team.
