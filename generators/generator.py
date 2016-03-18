#!/usr/bin/python

import argparse
import subprocess

MOSQUITTO = "mosquitto_pub"


def generate(server, topic, device):
    while True:
        subprocess.call([MOSQUITTO, "-h", server, "-t", topic, "-m", "gaugor:333|g"])

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Description of your program')
    parser.add_argument('-s', '--server', help='Server to publish to.', required=True)
    parser.add_argument('-t', '--topic', help='Topic to publish in.', required=True)
    parser.add_argument('-d', '--device', help='Device to generate stats for.', required=True)
    args = vars(parser.parse_args())

    generate(args["server"], args["topic"], args["device"])
