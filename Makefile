# Odoo 18 Development Makefile

.PHONY: up down restart logs shell update shell-db help

help:
	@echo "Available commands:"
	@echo "  make up         - Start the containers in background"
	@echo "  make down       - Stop and remove containers"
	@echo "  make restart    - Restart Odoo container"
	@echo "  make logs       - Tail Odoo logs"
	@echo "  make shell      - Open Odoo interactive shell"
	@echo "  make shell-db   - Open PostgreSQL shell"
	@echo "  make db-admin   - Open Adminer (Database UI) in browser"
	@echo "  make update m=MOD - Update a specific module (e.g., make update m=sale)"

up:
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart web

logs:
	docker compose logs -f web

shell:
	docker compose exec web python3 /opt/odoo/src/odoo-bin shell --config=/etc/odoo/odoo.conf

shell-db:
	docker compose exec db psql -U odoo -d postgres

db-admin:
	@echo "Opening Adminer at http://localhost:8080"
	@echo "Login with: Server=db, Username=odoo, Password=odoo, Database=postgres"
	@xdg-open http://localhost:8080 2>/dev/null || open http://localhost:8080 2>/dev/null || echo "Please open http://localhost:8080 in your browser"

update:
	docker compose exec web python3 /opt/odoo/src/odoo-bin -u $(m) --config=/etc/odoo/odoo.conf --stop-after-init
