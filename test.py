#! /usr/bin/env python 3.6
from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re

class TestHello(unittest.TestCase):
    def setUp(self):
        app.testing = True
        self.app = app.test_client()
    def test_hello(self):
        rv = self.app.get('/test')
        self.assertEqual(rv.status, '200 OK')
        self.assertEqual(rv.data, b'website is OK\n')
if __name__ == '__main__':
    unittest.main()
