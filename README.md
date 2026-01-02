# 🚀 Odoo 18 Development with Docker

This repository provides a premium, best-practice development environment for Odoo 118. It is designed to be fast, secure, and easy to use for the whole team.

## ✨ Features
- **Odoo 18 Ready**: Optimized for the latest Odoo features.
- **Dockerized**: Consistent environment across all developer machines.
- **One-Command Setup**: Get started in seconds with `make`.
- **Healthchecks**: Reliable startup (Odoo waits for the DB).
- **Environment Driven**: Secure configuration via `.env`.
- **RTL Support**: Pre-configured `rtlcss` for Arabic translations.

---

## 🛠️ Prerequisites
- [Docker](https://docs.docker.com/get-docker/) & [Docker Compose](https://docs.docker.com/compose/install/)
- [Make](https://www.gnu.org/software/make/) (usually pre-installed on Linux/Mac)

---

## 🏃 Quick Start

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd config-odoo18-with-docker
   ```

2. **Setup Environment:**
   ```bash
   cp .env.example .env
   # Edit .env if you need custom passwords
   ```

3. **Launch Odoo:**
   ```bash
   make up
   ```
   *Odoo will be available at [http://localhost:8069](http://localhost:8069)*

---

## ⌨️ Common Commands

We use a `Makefile` to make development easier. Here are the most used commands:

| Command | Description |
| :--- | :--- |
| `make up` | Start the environment in background |
| `make logs` | View live Odoo logs |
| `make restart` | Restart the Odoo service (useful after Python changes) |
| `make update m=module_name` | Update a specific Odoo module |
| `make shell` | Enter the Odoo interactive shell |
| `make shell-db` | Enter the PostgreSQL command line |
| `make down` | Stop and remove all containers |

---

## 📂 Project Structure

- `src/`: Odoo core source code (mapped as read-only for safety).
- `custom_addons/`: **Place your new modules here.**
- `config/`: Odoo configuration file (`odoo.conf`).
- `data/`: Odoo filestore (sessions, attachments, etc.).
- `db_data/`: PostgreSQL database files.

---

## 🚢 Deploying to Odoo.sh

For detailed instructions on how to push this setup to Odoo.sh, please refer to [ODOO_SH.md](./ODOO_SH.md).

---

## 📝 Best Practices for the Team
- **Don't hardcode**: Use environment variables for sensitive data.
- **Requirements**: If you add a python library, add it to `src/requirements.txt`.
- **Clean Code**: Follow Odoo coding guidelines for Python and XML.
