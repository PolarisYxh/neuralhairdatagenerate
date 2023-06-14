'''
Copyright@ Qiao-Mu(Albert) Ren. 
All Rights Reserved.
This is the code of HairNet.
Last modified by rqm @22:40, July 31, 2019
'''
import argparse
from model import train, test,save_net
import sys
import signal

parser = argparse.ArgumentParser(description='This is the implementation of HairNet by Qiao-Mu(Albert) Ren using Pytorch.')

parser.add_argument('--mode', type = str, default='train')
parser.add_argument('--path', type = str, default=r'F:\QiaomuRen_Data\HairNet_training_data')
parser.add_argument('--weight', type = str, default="")
args = parser.parse_args()
def signal_handler(sig,frame):
    save_net(args.path)
    print('You pressed Ctrl+C!')
    sys.exit(0)
def main():
    signal.signal(signal.SIGINT, signal_handler)
    if args.mode == 'train':
        print(args.path)
        train(args.path, args.weight)
    if args.mode == 'test':
        test(args.path, args.weight)

if __name__ == '__main__':
    main()


