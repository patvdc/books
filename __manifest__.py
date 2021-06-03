# -*- coding: utf-8 -*-

{
    'name': 'Books',
    'summary': '''
        Book Store Manager
        ''',
    'description': '''
       Book and author management module
       Goal : how to develop an Odoo-module
       ''',
    'author': 'pat.vdc',
    'website': 'https://www.odoo.com',
    'category': 'Tools',
    'sequence': -999,
    'version': '1.0',
    'depends': ['base'],
    'data': [
        # 'security/ir.model.access.csv',
        'views/book.xml',
        #  'views/templates.xml',
    ],
    'demo': [
        #    'demo/demo.xml',
    ],
    'css': [],
    'installable': True,
    'auto_install': False,
    'application': True,
}