from odoo import models, fields

class MyTask(models.Model):
    _name = 'my.task'
    _description = 'Task Manager'

    name = fields.Char(string='Task Name', required=True)
    description = fields.Text(string='Description')
    is_done = fields.Boolean(string='Completed', default=False)