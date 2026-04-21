# punjabi

Local MailCatcher wrapper for development email testing.

## Prerequisites

- Docker installed and running
- `make`

## Usage

- `make`: show the available targets
- `make start`: start MailCatcher
- `make stop`: stop the container
- `make restart`: recreate the container
- `make status`: show container state
- `make logs`: tail container logs

Mail is captured on SMTP `localhost:1025`.
The web UI is available at `http://localhost:1080`.

## Manual Check

1. Run `make start`.
2. Open `http://localhost:1080`.
3. Send a test email to SMTP host `localhost` on port `1025`.
4. Confirm the message appears in the MailCatcher UI.
