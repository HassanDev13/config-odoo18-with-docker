# 🚢 Deploying to Odoo.sh

Odoo.sh is a specialized platform. To make this repository work seamlessly with it, follow these guidelines.

## 1. Repository Structure
Odoo.sh expects your custom modules to be in the root of the repository or in subdirectories defined in your `odoo.conf`.

**Recommendation**:
Keep your `custom_addons` folder. On Odoo.sh, you can configure the "Addons Path" in the settings to include `/home/odoo/src/user/custom_addons`.

## 2. Managing Dependencies
- **Python libraries**: Odoo.sh automatically installs libraries listed in `requirements.txt` at the root of your repository.
- **External modules**: If you use community modules (from OCA, etc.), add them as **Git Submodules** in a `submodules/` folder.

## 3. Configuration
Odoo.sh manages `odoo.conf` for you. Most settings in our local `config/odoo.conf` will be ignored or overridden by Odoo.sh.
- **Local specific settings**: Things like `db_host` or `admin_passwd` are only for your local Docker environment.
- **Odoo.sh Settings**: Use the Odoo.sh "Settings" tab to manage workers, database size, and specific Odoo parameters.

## 4. Deployment Flow
1. **Develop Localy**: Use Docker to build and test your feature.
2. **Commit & Push**: Push your changes to your feature branch (e.g., `feature/my-new-module`).
3. **Staging**: Odoo.sh will automatically create a staging build. Test it thoroughly.
4. **Merge**: Once verified, merge to `production`.

## 5. Pro Tips for Odoo.sh
- **Logs**: Use the Odoo.sh "Shell" or "Logs" tab to debug production issues.
- **Backup**: Always test migration scripts on a staging branch with a "Production Data" dump before merging to production.
