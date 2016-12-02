import random
import time
import json

# get a node from a node name
def get_node(node_name, node_list):
    return next((i for i in node_list if i.name == node_name), None)


class Message():
    def __init__(self, sender):
        self.id = random.randint(100, 1000)
        self.sender = sender
        self.text = 'Message from {0} at {1}'.format(sender.name,
            time.strftime('%Y-%m-%d %H:%M:%S'))
        sender.received_messages.append(self)

    def __repr__(self):
        return self.text


class Node():

    def __init__(self, name, neighbors=None):
        self.name = name
        self.neighbors = neighbors
        self.received_messages = []

    def __repr__(self):
        return self.name

    def gossip(self, message):
        