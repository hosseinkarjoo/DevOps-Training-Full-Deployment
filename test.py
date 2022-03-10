#! /usr/bin/env python 3.6
import unittest
import main
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
