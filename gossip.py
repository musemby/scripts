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

        #nodes that have already received this message
        self.infected_nodes = [sender]

    def __repr__(self):
        return self.text


class Node():

    def __init__(self, name, neighbors=None):
        self.name = name
        self.neighbors = neighbors
        self.received_messages = []

    def __repr__(self):
        return self.name

    def gossip(self, message=None):
        if message:
            forward_mode = True
            message.infected_nodes.append(self)
            print("At {0}: Received from {1}".format(self.name, message.sender.name))
        else:
            forward_mode = False
            message = Message(self)

        for node in self.neighbors:
            node = get_node(node, node_list)

            if node in message.infected_nodes:
                pass
            else:
                if forward_mode:
                    message.sender = self
                    print("At {0} Sending to {1}".format(self.name, node.name))
                else:
                    # print("Infected nodes are {}".format(message.infected_nodes))
                    print("Starting the gossip. Sending from",
                        message.sender.name, "to", node.name)
                node.gossip(message=message)

node_list = [
    Node('node1', neighbors=['node3', 'node2']),
    Node('node2', neighbors=['node1', 'node4', 'node5']),
    Node('node3', neighbors=['node1']),
    Node('node4', neighbors=['node2']),
    Node('node5', neighbors=['node2', 'node6', 'node7']),
    Node('node6', neighbors=['node5']),
    Node('node7', neighbors=['node5'])
]

node_list[3].gossip()
