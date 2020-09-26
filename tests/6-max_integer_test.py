#!/usr/bin/python3
"""Unittest for max_integer([..])
"""
import unittest
max_integer = __import__('6-max_integer').max_integer


class TestMaxInteger(unittest.TestCase):
    """This class tests the max_integer function"""

    def test_max(self):
        """Check output for normal input"""
        self.assertEqual(max_integer([1, 50, 2]), 50)
        self.assertEqual(max_integer([1, 5, 20]), 20)
        self.assertEqual(max_integer([-5, -10, -9]), -5)
        self.assertEqual(max_integer([-5, 10, 9]), 10)
        self.assertEqual(max_integer([1]), 1)
        self.assertEqual(max_integer([1, 1, 1, 1]), 1)
        self.assertEqual(max_integer([2, 4] * 3), 4)

    def test_empty(self):
        """Check for an empty list"""
        self.assertEqual(max_integer([]), None)

    def test_tuple(self):
        """Check for different types of input"""
        with self.assertRaises(TypeError):
            _max = max_integer((3, 2, "L"))

    def test_big_number(self):
        """Check for big numbers"""
        _list = [2135456413213546541321324163463123132746,
                 13524654351321324135461321354]
        self.assertEqual(max_integer(_list),
                         2135456413213546541321324163463123132746)

    def test_docstringmod(self):
        """Check docstring for module"""
        m = __import__('6-max_integer').__doc__
        self.assertTrue(m is not None and len(m) > 0)

    def test_docstringfunc(self):
        """"Check docstring for function"""
        f = __import__('6-max_integer').max_integer.__doc__
        self.assertTrue(f is not None and len(f) > 5)


if __name__ == '__main__':
    unittest.main()
