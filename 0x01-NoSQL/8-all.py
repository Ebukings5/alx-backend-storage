#!/usr/bin/env python3

"""
     function that lists all documents in a collection:
"""

from pymongo import MongoClient

def list_all(mongo_collection):
    """
    Args:
        mongo_collection (pymongo.collection.Collection): pymongo collection object
    retuns:
        list: lists all documents in collection.
    """
    return list(mongo_collection.find())
