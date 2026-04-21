# Repository Guidelines

## Project Structure & Module Organization
This repository is intentionally small. The root contains:

- `Makefile`: operational commands for running the local MailCatcher container.
- `README.md`: short project description.

There is no `src/`, `tests/`, or asset directory yet. Keep new automation files at the root unless the project grows enough to justify dedicated folders such as `scripts/` or `docs/`.

## Build, Test, and Development Commands
This project depends on Docker being installed and running.

- `make`: shows the available targets and ports.
- `make start`: starts the `schickling/mailcatcher` container and exposes SMTP on `1025` and the web UI on `1080`.
- `make stop`: stops the running MailCatcher container.
- `make restart`: recreates the container by calling `stop` then `start`.
- `make logs`: tails container logs for debugging startup or delivery issues.
- `make status`: shows whether the container is running.

Example: open `http://localhost:1080` after `make start` to inspect captured mail.

## Coding Style & Naming Conventions
Follow existing `Makefile` conventions:

- Use tabs for command indentation in make targets.
- Keep variable names uppercase, for example `PORT_HTTP`.
- Use short, task-oriented target names such as `start`, `stop`, and `logs`.

If shell scripts are added later, prefer POSIX-compatible shell unless Bash is required, and keep configuration values centralized near the top of the file.

## Testing Guidelines
There is no automated test suite yet. For changes to runtime behavior, verify manually:

- Run `make start`.
- Run `make status` to confirm the container is up.
- Open the MailCatcher UI on port `1080`.
- Send a test message to SMTP host `localhost` on port `1025`.
- Confirm the message appears in the MailCatcher inbox.
- Review `make logs` for container errors.

If tests are added, place them in a dedicated `tests/` directory and document the execution command here.

## Commit & Pull Request Guidelines
Current history uses short commit subjects (`Initial commit`, `up`). Prefer clearer imperative messages such as `Add restart target` or `Document Docker ports`.

Pull requests should include:

- a concise summary of the operational change,
- any Docker or port changes,
- manual verification steps performed,
- screenshots only when the MailCatcher UI behavior changes.
