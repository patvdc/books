# -*- coding: utf-8 -*-
from odoo import models, fields

class Book(models.Model):
    _name = 'book'
    _description = 'Books'

    name = fields.Char('Title', required=True)
    date_release = fields.Date('Release Date')
    author_ids = fields.Many2many('res.partner', string='Authors')
