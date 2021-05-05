import argparse
import yaml


def read_yaml_file(yaml_path: str):
    with open(yaml_path, 'r') as stream:
        try:
            config = yaml.safe_load(stream)
        except yaml.YAMLError as exc:
            print(exc)
    return config


def main_func(args):
    config = read_yaml_file(args.config_filepath)

    # If use passed in the -n argument, then assign new key / value pair
    if args.newparam:
        config['newparam'] = args.newparam
    print(config)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Read and print yaml file')
    parser.add_argument(
        '--config_filepath',
        '-c',
        help='Path to config file',
        type=str,
        default='/home/worker/configs/simple.yaml'  # Note that this default file location is the docker volume path
    )
    parser.add_argument(
        '--newparam',
        '-n',
        help='New parameter to add as key',
        type=str,
        default=None
    )
    args = parser.parse_args()
    main_func(args)
