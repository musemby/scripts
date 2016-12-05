import random
import time

'''
    This is an illustration of the gossip algorithm
    author: @musemby
'''


# get a node from a node name (this makes for an easier structuring of the graph)
def get_node(node_name, node_list):
    return next((i for i in node_list if i.name == node_name), None)


class Message():
    def __init__(self, sender):
        self.id = random.randint(100, 1000)
        self.sender = sender
        self.text = 'Message from {0} at {1}'.format(sender.name,
            time.strftime('%Y-%m-%d %H:%M:%S'))
        # the sender has already 'received the message'
        sender.received_messages.append(self)

    def __repr__(self):
        # the string representation of the message
        return self.text



class Node():

    def __init__(self, name, neighbors=None):
        self.name = name
        self.neighbors = neighbors
        self.received_messages = []

    def __repr__(self):
        # the string representation of the node
        return self.name

    def gossip(self, message=None):
        # called with a message only when current node is not the original sender (message is a forward)
        if message:
            forward_mode = True
            self.received_messages.append(message)
        else:
            # otherwise this is the originator of the message so we create a new message for it to send
            forward_mode = False
            message = Message(self)

        for node in self.neighbors:
            # potential recipient
            node = get_node(node, node_list)

            if message in node.received_messages:
                # already received the message so do nothing
                pass
            else:
                if forward_mode:
                    # set self as sender in preparation for forwarding
                    message.sender = self
                    print("At {0} Sending to {1}".format(message.sender.name, node.name))
                    time.sleep(1)
                else:
                    # otherwise prepare to start a new send
                    print("Starting the gossip. Sending from",
                        self.name, "to", node.name)
                    time.sleep(1)
                # do actual sending by recursively calling the node's gossip method
                node.gossip(message=message)


node_list = [
    Node('node1', neighbors=['node3', 'node2']),
    Node('node2', neighbors=['node1', 'node4', 'node5']),
    Node('node3', neighbors=['node1']),
    Node('node4', neighbors=['node2', 'node5']),
    Node('node5', neighbors=['node2', 'node4', 'node6', 'node7']),
    Node('node6', neighbors=['node5']),
    Node('node7', neighbors=['node5'])
]

node_list[4].gossip()