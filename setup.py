from distutils.core import setup

setup(
    name='botanizer',
    version='0.1',
    license='None (All rights reserved)',
    description="Example python library with a nix flake dependency",
    packages={'botanizer'},
    install_requires=[
        'flower_power'
    ]
)
